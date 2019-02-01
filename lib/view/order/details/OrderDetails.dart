import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import '../paySuccess/PaySuccess.dart';
import 'dart:async';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'package:kaka_flutter_mp/model/Unfinishorder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderDetails extends StatefulWidget{
  final orderid;
//  OrderDetails({Key key,this.orderid}):super(key:key);
  OrderDetails(this.orderid);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderDetailState();
  }
}

class OrderDetailState extends State<OrderDetails>{
  int rvalue = 0;
  Map data = {};
  bool isGetDatas = false;
  Future getData() async{
    isGetDatas = false;

    var response = await HttpUtil().get('/mp/order/${widget.orderid}');

  if(response['success']!=null) {
       isGetDatas = true;
       print(response);
       Map datt= response['result'];
       setState(() {
          data = Unfinishorder.fromJson(datt).toJson();
//          data = response['result'];
       });
       print('*******');
       print(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();

  }

  String timer;
  String moneys;
  Widget contents;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(isGetDatas) {
      contents = Container(
        color: Color(0xFF4482FF),
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5.0)
          ),
          child:ListView(
            children: <Widget>[
              payMoney(),
              parkMsg(),
              payType(),
            ],
          ),
        ),
      );

    }else if(this.data.length == 0  && isGetDatas == false){
      contents = Container(child:SpinKitFadingCircle(color: Color.fromRGBO(0, 0, 0, .5), size: 50.0,)); //加载动画
    }

    return Scaffold(
      appBar: MAppBar(
        isgoback: false,
        title: Text('订单详情'),
      ).build(context),
      body:contents ,
    );
  }
  //应付金额
  Widget payMoney() {
     return Container(
       padding: EdgeInsets.only(top:20.0,bottom: 20.0),
       decoration: BoxDecoration(
         border: Border(
           top: BorderSide(width: 0, color: Color(0x66ffffff)),
           left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
           right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
           bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
         )
       ),
       child: Column(
         children: <Widget>[
           Container(
             child: Text('应付款金额',style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top:3.0),
                 child:Text('￥',style: TextStyle(fontSize: 24.0,color: Color(0xFFFF6D6D),fontWeight: FontWeight.bold)),
               ),
               Container(
                 child: Text((data['realMoney']/100).toString(),style: TextStyle(fontSize: 34.0,color: Color(0xFFFF6D6D),fontWeight: FontWeight.bold)),
               )
             ],
           ),
           Container(
             child: Text('请在48小时内完成支付',style: TextStyle(fontSize: 12.0,color: Color(0xFF999999)),),
           ),
         ],
       ),
     );
  }

  //应付金额
  Widget parkMsg() {
    return Stack(
       children: <Widget>[
         Container(
           padding: EdgeInsets.all(15.0),
           decoration:BoxDecoration(
               border: Border(
                 top: BorderSide(width: 0, color: Color(0x66ffffff)),
                 left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                 right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                 bottom: BorderSide(width: 1.0, color: Color(0xFF4482FF)),
               )
           ),
           child: Column(
             children: <Widget>[
               Container(
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('停车地址：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                     ),
                     Expanded(
                       child: Text(data['areaName']+data['streetName']+data['lotName'],
                         style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
                       ),
                     )
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:5.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('车 位 号：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666),letterSpacing: 1.0),),
                     ),
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top:5.0),child: Text(data['placeNum'].toString(), style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                     )
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:5.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('车 牌 号：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666),letterSpacing: 1.0),),
                     ),
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top:5.0),child: Text(data['plateNumber'].toString(), style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                     )
                   ],
                 ),
               ),

               Container(
                 margin: EdgeInsets.only(top:5.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('开始时间：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                     ),
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top:5.0),child: Text(data['startAt'].toString(), style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                     )
                   ],
                 ),
               ),

               Container(
                 margin: EdgeInsets.only(top:5.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('结束时间：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                     ),
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top:5.0),child: Text(data['endAt'].toString(), style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                     )
                   ],
                 ),
               ),

               Container(
                 margin: EdgeInsets.only(top:5.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       width: 74.0,
                       child: Text('停车时长：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                     ),
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top:3.0),child: Text(data['duringTime']>60 ?
                         '${(data['duringTime']/60).floor()}小时${data['duringTime']%60}分':
                         '${data['duringTime']%60}分'
                           , style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                     )
                   ],
                 ),
               ),
             ],
           ),
         ),
           new Positioned(//
             right: -10.0,
             bottom: -10.0,
             child:  Container(
               width: 20.0,
               height: 20.0,
               decoration:BoxDecoration(
                   color: Color(0xFF4482FF),
                   borderRadius: BorderRadius.circular(20.0)
               ),
             )
          ),

         new Positioned(//
             left: -10.0,
             bottom: -10.0,
             child:  Container(
               width: 20.0,
               height: 20.0,
               decoration:BoxDecoration(
                   color: Color(0xFF4482FF),
                   borderRadius: BorderRadius.circular(20.0)
               ),
             )
         ),
       ],
    );
  }

  //支付方式
  Widget payType() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(left: 15.0,bottom: 0.0),
                child: Text('支付方式',style: TextStyle(fontSize: 17.0,color: MTheme.sizeColor,fontWeight: FontWeight.w800),),
              ),
              Container(
//                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() { rvalue = 1;});
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 0, color: Color(0x66ffffff)),
                              left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                              right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                              bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                            )
                        ),
                        child:Row(
                          children: <Widget>[
                            Icon(MIcons.yue,size: 35.0,color: Color(0xFFFF9833),),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text('可用余额：￥85',style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
                            ),
                            Expanded(child:Container(
                              alignment: Alignment.centerRight,
                              child: Radio(
                                value: 1,
                                groupValue: rvalue,
                                onChanged: (value) { setState(() { rvalue = value;});},
                                activeColor: Color(0xFF4482FF),),
                            ))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() { rvalue = 2;});
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 0, color: Color(0x66ffffff)),
                              left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                              right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                              bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                            )
                        ),
                        child:Row(
                          children: <Widget>[
                            Icon(MIcons.weixin,size: 35.0,color: Color(0xFF2CBA27),),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text('微信支付',style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
                            ),
                            Expanded(child:Container(
                              alignment: Alignment.centerRight,
                              child: Radio(
                                value: 2,
                                groupValue: rvalue,
                                onChanged: (value) { setState(() { rvalue = value;});},
                                activeColor: Color(0xFF4482FF),),
                            ))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() { rvalue = 3;});
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                        child:Row(
                          children: <Widget>[
                            Icon(MIcons.zhifubao,size: 35.0,color: Color(0xFF3BA1F3),),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text('支付宝支付',style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
                            ),
                            Expanded(child:Container(
                              alignment: Alignment.centerRight,
                              child: Radio(
                                value: 3,
                                groupValue: rvalue,
                                onChanged: (value) { setState(() { rvalue = value;});},
                                activeColor: Color(0xFF4482FF),),
                            ))
                          ],
                        ),
                      ),
                    ),
                    
                    InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(top:20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(child:MButton(
                                button: Container(
                                  padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                                  child:  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaySuccess()));
                                    },
                                    child:Text('立即付款',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,color: Colors.white),),
                                  )
                              ),),
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        new Positioned(//
            right: -10.0,
            top: -10.0,
            child:  Container(
              width: 20.0,
              height: 20.0,
              decoration:BoxDecoration(
                  color: Color(0xFF4482FF),
                  borderRadius: BorderRadius.circular(20.0)
              ),
            )
        ),
        new Positioned(//
            left: -10.0,
            top: -10.0,
            child:  Container(
              width: 20.0,
              height: 20.0,
              decoration:BoxDecoration(
                  color: Color(0xFF4482FF),
                  borderRadius: BorderRadius.circular(20.0)
              ),
            )
        ),
      ],
    );
  }
}