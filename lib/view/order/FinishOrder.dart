import 'package:flutter/material.dart';
import 'child/FinishedList.dart';
import 'child/NoOrder.dart';
import 'dart:async';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kaka_flutter_mp/model/Unfinishorder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; //加载动画
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:kaka_flutter_mp/component/CirclePainter.dart';

class FinishOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FinishOrderState();
  }
}

class FinishOrderState extends State<FinishOrder>
    with TickerProviderStateMixin {
  ValueNotifier<double> topOffsetLis = new ValueNotifier(-10.0);
  ValueNotifier<double> bottomOffsetLis = new ValueNotifier(-10.0);
  RefreshController _refreshController;

  Widget contexts; //渲染Widget
  List<Widget> finishedLists = [];

  List<dynamic> finishedData = [];

  int pageNum = 1; //请求页数
  int total = 1; //总共页数
  Widget refreshIndicator; //上拉刷新下拉加载更多效果
  bool getmore = true; //是否允许加载更多
  bool isGetDatas = false; //是否拿到数据

  Future getData() async {
    isGetDatas = false;
    var response = await HttpUtil()
        .get('/mp/orders', data: {'status': true, 'pageNum': pageNum});
    print(response['result']);
    if (response['success']) {
      isGetDatas = true;
      SharedPreferences pageCount =
          await SharedPreferences.getInstance(); //存储分页
      pageCount.setInt('Unfinishordertotal', response['result']['total']);
      pageCount.setInt('Unfinishordersize', response['result']['size']);
      pageCount.setInt('Unfinishordercurrent', response['result']['current']);
      pageCount.setInt('Unfinishorderpages', response['result']['pages']);

      total = pageCount.getInt('Unfinishordertotal');

      setState(() {
        finishedData = response['result']['records']
            .map((json) => Unfinishorder.fromJson(json))
            .toList();
      });

      print(finishedData);
    }
  }

  List<Widget> carList() {
//    finishedLists=[];
    for (Unfinishorder item in finishedData) {
      var v = item.toJson();
      finishedLists.add(FinishedList(
        carNum: v['plateNumber'],
        stopTime: v['duringTime'].toString(),
        money: v['realMoney'].toString(),
        stopArea: v['lotName'],
        streetName: v['streetName'],
        areaName: v['areaName'],
        orderId: v['id'],
        stopDay: v['createdAt'],
      ));
    }
    return finishedLists;
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
    getData().then((val) {
      carList();
    });
    _refreshController = new RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    total > 1 ? getmore = true : getmore = false;
    refreshIndicator = new Container(
        child: new Stack(
      children: <Widget>[
        getmore
            ? new Align(
                //下拉动画
                alignment: Alignment.topCenter,
                child: new ClipPath(
                  clipper:
                      new CirclePainter(offset: topOffsetLis.value, up: true),
                  child: new Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.05),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              )
            : new Align(),
        getmore
            ? new Align(
                //上拉动画
                child: new ClipPath(
                  clipper: new CirclePainter(
                      offset: bottomOffsetLis.value, up: false),
                  child: new Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.05),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                alignment: Alignment.bottomCenter,
              )
            : new Align(),
        new SmartRefresher(
          enablePullUp: getmore,
          enablePullDown: getmore,
          controller: _refreshController,
          footerConfig: new RefreshConfig(),
          onRefresh: (up) {
            if (up) //上拉刷新 pagNum 设置为1
              new Future.delayed(const Duration(milliseconds: 2009))
                  .then((val) {
                setState(() {
                  pageNum = 1;
                  finishedLists = [];
                  getData().then((onValue) {
                    carList();
                  });
                });
                _refreshController.sendBack(true, RefreshStatus.completed);
              });
            else {
              //添加数据
              pageNum++;
              print(total);
              print(pageNum);
              new Future.delayed(const Duration(milliseconds: 2009))
                  .then((val) {
                if (pageNum <= total) {
                  getData().then((onValue) {
                    carList();
                  });
                  _refreshController.sendBack(false, RefreshStatus.completed);
                }
                if (pageNum > total) {
                  _refreshController.sendBack(false, RefreshStatus.noMore);
                }
              });
            }
          },
          onOffsetChange: _onOffsetCallback,
          child: new ListView.builder(
//            itemExtent: 100.0,
            itemCount: finishedLists.length,
            itemBuilder: (context, index) {
              return finishedLists[index];
            },
          ),
        )
      ],
    ));

    if (this.finishedData.length > 0 && isGetDatas) {
      contexts = new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: refreshIndicator);
    } else if (this.finishedData.length == 0 && isGetDatas == false) {
      contexts = Container(
          child: SpinKitFadingCircle(
        color: Color.fromRGBO(0, 0, 0, .5),
        size: 50.0,
      )); //加载动画
    } else if (this.finishedData.length == 0 && isGetDatas == true) {
      contexts = NoOrder();
    }
    return contexts;
  }
}
