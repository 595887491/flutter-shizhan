import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/icon.dart';
import '../child/OrdersList.dart';
import '../../order/child/NoOrder.dart';
import 'dart:async';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kaka_flutter_mp/model/Unfinishorder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; //加载动画
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:kaka_flutter_mp/component/CirclePainter.dart';
import '../invoice/InvoiceIndex.dart';

class Orders extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrdersState();
  }
}

class OrdersState extends State<Orders> {
  Widget contexts;
  List<Widget> finishLists = [];

  List<Map> unfinishData= [
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false
    },
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false,
    },
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false
    },
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false,
    },
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false
    },
    {
      'orderId':'001',
      'carNum':'京Q32716',
      'stopTime':'停车时长:2小时35分',
      'money':'25',
      'stopArea':'高新区广都上街石油小区外辅道中段左侧',
      'stopDay':'2018-09-04',
      'check':false,
    },
  ];

  List<Widget> carList() {
    finishLists = [];
    for(Map item in unfinishData) {
      finishLists.add(OrdersList(
        orderId:item['orderId'],
        carNum:item['carNum'],
        stopTime:item['stopTime'],
        money:item['money'],
        stopArea:item['stopArea'],
        stopDay:item['stopDay'],
        check:item['check'],
        isinvoice:this.isinvoice,
        isallChecked:this.isallChecked,
        datas:this.unfinishData,
      ));
    }
    return finishLists;
  }

  bool isallChecked = false; //是否全选

  bool isinvoice = false; //是否点击开发票


  ValueNotifier<double> topOffsetLis = new ValueNotifier(-10.0);
  ValueNotifier<double> bottomOffsetLis = new ValueNotifier(-10.0);
  RefreshController _refreshController;

  int pageNum=1; //请求页数
  int total = 1;//总共页数
  Widget refreshIndicator;  //上拉刷新下拉加载更多效果
  bool getmore = true;  //是否允许加载更多
  bool isGetDatas = false; //是否拿到数据


  Future getData() async{
    isGetDatas = false;
    var response = await HttpUtil().get('/mp/orders',
        data: {'status':false,'pageNum':pageNum});
    print( response['result']);
    if(response['success']) {
      isGetDatas  = true;
      SharedPreferences pageCount = await SharedPreferences.getInstance(); //存储分页
      pageCount.setInt('Unfinishordertotal', response['result']['total']);
      pageCount.setInt('Unfinishordersize', response['result']['size']);
      pageCount.setInt('Unfinishordercurrent', response['result']['current']);
      pageCount.setInt('Unfinishorderpages', response['result']['pages']);

      total = pageCount.getInt('Unfinishordertotal');

      setState(() {
        unfinishData = response['result']['records'].map((json) => Unfinishorder.fromJson(json)).toList();
      });

      print(unfinishData);
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
//    getData().then((val) {
//      carList();
//    });
    _refreshController = new RefreshController();
    super.initState();
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
                      finishLists = [];
                      getData().then((onValue) {
                        carList();
                      });
                    });
                    _refreshController.sendBack(true, RefreshStatus.completed);
                  });
                else {  //添加数据
                  pageNum++;
                  print(total);
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
                itemCount: finishLists.length,
                itemBuilder: (context, index) {
                  return finishLists[index];
                },
              ),
            )
          ],
        ));

    // TODO: implement build
    return  MaterialApp(
            theme: ThemeData(
              primaryColor: Color(0xFF4482FF),),
      home:Scaffold(
        appBar: PreferredSize(
            child:
        AppBar(
            title:new Center(
              child:  Text('选择开票订单'),
            ),
            leading:  IconButton(
              icon: Icon(
                MyIcons.icon2,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              onPressed: () { Navigator.pop(context);},
            ),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    this.isinvoice =! this.isinvoice;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:12.0,right:20.0),
                  child: Text('开发票',style: TextStyle(fontSize: 14.0,color:Colors.white,fontWeight: FontWeight.w500),),
                ),
              )
            ]
        ), preferredSize: Size.fromHeight(44)),
          body:Page(context),
      ) ,
    );
  }

  Widget Page(context) {
    Widget bottomContext;
    var marginBottom;

    if(this.isinvoice == true) {
      marginBottom = EdgeInsets.only(bottom: 55.0);
      bottomContext = Container(
        color: Color(0xFFFFFFFF),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          children: <Widget>[
            Stack(
              alignment: Alignment(2.8, 0),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5.0),
//                     color: Colors.red,
                  child:new Checkbox(
                    value: this.isallChecked,
                    activeColor: Color(0xFF4482FF),
                    onChanged: (bool val) {
                      print('11');
                      // val 是布尔值
                      setState(() {
                        isallChecked = !isallChecked;

                        for(Map item in unfinishData) {
                            item['check'] = isallChecked;
                        }
                      });
                    },
                  ),
                ),
                Text('全选'),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InvoiceIndex()));
              },
              child: Container(
//                       alignment: Alignment.centerRight,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/3,
                height: 50.0,
                color: Color(0xFF4482FF),
                child: Text('下一步',style: TextStyle(fontSize: 18.0,color: Color(0xFFFFFFFF),fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      );
    }else{
      marginBottom = EdgeInsets.only(bottom: 0.0);
      bottomContext = Container();
    }

    if(this.unfinishData.length>0) {
      contexts = new Container(
//        padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,0),
        color: Color(0xFFEEEEEE),
        child:Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              margin: marginBottom,
              child: ListView(
                children: <Widget>[
                  Column(
                    children:carList(),
                  )
                ],),
            ),
            bottomContext,

          ],
        )
      );
    }else{
      contexts = NoOrder();
    }
    // TODO: implement build
    return contexts;
  }

}