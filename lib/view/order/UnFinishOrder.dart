import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'child/UnfinishList.dart';
import 'child/NoOrder.dart';
import 'package:kaka_flutter_mp/component/CirclePainter.dart';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'package:kaka_flutter_mp/model/Unfinishorder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class UnFinishOrder extends StatefulWidget {
  UnFinishOrder({Key key}) : super(key: key);

  @override
  UnFinishOrderState createState() => new UnFinishOrderState();
}

class UnFinishOrderState extends State<UnFinishOrder> with TickerProviderStateMixin {
  ValueNotifier<double> topOffsetLis = new ValueNotifier(-10.0);
  ValueNotifier<double> bottomOffsetLis = new ValueNotifier(-10.0);
  RefreshController _refreshController;

  Widget refreshIndicator;  //上拉刷新下拉加载更多效果
  Widget contexts;  //渲染Widget
  List<Widget> unfinishLists = [];  //拿到请求数据渲染成展示卡片Widget
  bool isPerformingRequest = false; // 是否有请求正在进行
  List<dynamic> unfinishData=[]; //请求数据
  bool isGetDatas = false; //是否拿到数据
  int pageNum = 1; //当前分页
  var total = 1; //总共页数
  bool getmore = true;  //是否允许加载更多


  List<Widget> carList() {
//    unfinishLists=[];
    for(Unfinishorder item in unfinishData) {
      var v = item.toJson();
      unfinishLists.add(UnfinishList(
        carNum:v['plateNumber'],
        stopTime:v['duringTime'].toString(),
        money:v['realMoney'].toString(),
        stopArea:v['lotName'],
        streetName:v['streetName'],
        areaName:v['areaName'],
        orderId:v['id'],
        stopDay:v['createdAt'],
      ));
    }
    return unfinishLists;
  }
  //请求数据
  Future getData() async {
    isGetDatas = false;
    var response = await HttpUtil().get('/mp/orders',
        data: {'status':false,'pageNum':pageNum});
    if(response['success']) {
      isGetDatas = true;
      print( response['result'] );
      SharedPreferences pageCount = await SharedPreferences.getInstance(); //存储分页
      pageCount.setInt('Unfinishordertotal', response['result']['total']);
      pageCount.setInt('Unfinishordersize', response['result']['size']);
      pageCount.setInt('Unfinishordercurrent', response['result']['current']);
      pageCount.setInt('Unfinishorderpages', response['result']['pages']);
      total = pageCount.getInt('Unfinishordertotal');


//      List  responseJson  = json.decode(response['result']['records']); //将接口返回的数据使用decode转化为dart的对象；
       setState(() {
         unfinishData = response['result']['records'].map((json) => Unfinishorder.fromJson(json)).toList();
       });
       print('***********');
       print( total);
    }
  }

  void _onOffsetCallback(bool isUp, double offset) {
    if (isUp) {
      topOffsetLis.value = offset;
    } else {
      bottomOffsetLis.value = offset;
    }
  }

  @override
  void initState() {
// TODO: implement initState
    getData().then((val) {
      carList();
    });


    _refreshController = new RefreshController();

    super.initState();
    topOffsetLis.addListener(() {
      setState(() {});
    });
    bottomOffsetLis.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    total > 1 ?getmore = true: getmore = false;
    refreshIndicator = new Container(
        child: new Stack(
          children: <Widget>[
            getmore ? new Align(  //下拉动画
              alignment: Alignment.topCenter,
              child: new ClipPath(
                clipper: new CirclePainter(offset: topOffsetLis.value, up: true),
                child: new Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ):new Align(),
            getmore ? new Align(  //上拉动画
              child: new ClipPath(
                clipper:
                new CirclePainter(offset: bottomOffsetLis.value, up: false),
                child: new Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ):new Align(),

            new SmartRefresher(
              enablePullUp: getmore,
              enablePullDown: getmore,
              controller: _refreshController,
              footerConfig: new RefreshConfig(),
              onRefresh: (up) {
                if (up)   //上拉刷新 pagNum 设置为1
                  new Future.delayed(const Duration(milliseconds: 2009))
                      .then((val) {
                        setState(() {
                          pageNum = 1;
                          unfinishLists=[];
                          getData().then((onValue) {
                            carList();
                          });
                        });
                    _refreshController.sendBack(true, RefreshStatus.completed);
                  });
                else {  //添加数据
                  pageNum++;
                  print(pageNum);
                  new Future.delayed(const Duration(milliseconds: 2009))
                  .then((val) {
                      if(pageNum <= total) {
                        getData().then((onValue) {
                          carList();
                          });
                        _refreshController.sendBack(false, RefreshStatus.completed);
                      }if(pageNum > total){
                        _refreshController.sendBack(false, RefreshStatus.noMore);
                      }
                  });
                }
              },
              onOffsetChange: _onOffsetCallback,
              child: new ListView.builder(
//            itemExtent: 100.0,
                itemCount: unfinishLists.length,
                itemBuilder: (context, index) {
                    return unfinishLists[index];
                },
              ),
            )
          ],
        ));
    if(this.unfinishData.length>0 && isGetDatas) {
      contexts = new Padding(
          padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,0),
          child:refreshIndicator
      );
    }else if(this.unfinishData.length== 0 && isGetDatas  == false){
      contexts = Container(child:SpinKitFadingCircle(color: Color.fromRGBO(0, 0, 0, .5), size: 50.0,)); //加载动画
    }
    else if(this.unfinishData.length== 0 && isGetDatas == true) {
      contexts = NoOrder();
    }
    return contexts;
  }
}
