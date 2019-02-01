import 'package:flutter/material.dart';
import 'FinishOrder.dart';
import 'UnFinishOrder.dart';

class Order extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    return new MaterialApp(
//      theme: ThemeData(
//      primaryColor: Color(0xFF4482FF),),
    return new DefaultTabController(
//        length: choices.length,
        length:2,
        child: new Scaffold(
          appBar: PreferredSize(child:
          new AppBar(
            backgroundColor: Colors.white,
            bottom:new TabBar(
             // indicator: new ShapeDecoration(shape: new Border.all(color: Colors.redAccent, width: 1.0),color: Color(0xFFFFFFFF)), //选中的tab样式装饰
              indicatorSize: TabBarIndicatorSize.tab, //tab label  两个值
              indicatorColor:Color(0xFF4482FF), //选中下划线颜色
              indicatorWeight: 2.0, //选中下划线厚度
              labelColor:Color(0xFF4482FF),  //选中文字颜色
              labelStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
              unselectedLabelColor: Color(0xFF333333), //未选中文字颜色
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF333333)),
//              isScrollable: true,
              tabs: [
                 Tab(text: "未完成订单(3)"),
                 Tab(text: "已完成订单(1)"),
              ],
            ),
          ),preferredSize: Size.fromHeight(50),),
          body:Container(
            color: Color(0xFFEEEEEE),
            child:  new TabBarView(
              children: [
                 UnFinishOrder(), //未完成
                 FinishOrder() , //已完成
              ]
            ),
          )
        ),
//      ),
    );
  }
}


