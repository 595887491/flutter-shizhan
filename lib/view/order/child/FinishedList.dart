import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import '../details/OrderDetails.dart';
import 'dart:async';
import 'package:kaka_flutter_mp/http/httpUtil.dart';

class FinishedList extends StatefulWidget{
  final carNum;
  final stopTime;
  final money;
  final stopArea;
  final orderId;
  final stopDay;
  final areaName;
  final streetName;

  FinishedList({Key key,this.carNum,this.stopTime,this.money,this.stopArea,this.orderId,this.stopDay,this.areaName,this.streetName,}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FinishedListState();
  }
}

class FinishedListState extends State<FinishedList>{
  String timer; //停车时长
  bool isChecked = false;
  String moneys; //停车金额

  String orderid;


  @override
  Widget build(BuildContext context) {
    if(int.parse(widget.stopTime) >= 60 ) {
      timer = '停车时长：${(int.parse(widget.stopTime)/60).floor()}小时 ${int.parse(widget.stopTime)%60}分';
    }else{
      timer = '停车时长：${int.parse(widget.stopTime)}分';
    }

    moneys = '${int.parse(widget.money)/100}';
    // TODO: implement build
    return     Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.carNum,style: TextStyle(fontSize: 18.0,color: MTheme.sizeColor,fontWeight: FontWeight.bold),),
                            Text(timer,style: TextStyle(fontSize: 13.0,color: Color(0xFF666666)),),
                          ],
                        ),
                        Expanded(
                            child: Container(
                              child: Row(
                                //                      crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(moneys,style: TextStyle(fontSize: 21.0,color: Color(0xFFFF6D6D),fontWeight: FontWeight.w800)),
                                  Text('元'),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Text(widget.areaName+widget.streetName+widget.stopArea,
                      style: TextStyle(fontSize: 13.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(  //分割线
//                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: .5,color: Color(0xFFE5E5E5))
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Row(
                      children: <Widget>[
                        Text(widget.stopTime,style: TextStyle(fontSize: 12.0,color: Color(0xFF999999),fontWeight: FontWeight.w500),),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child:InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked = ! isChecked;
                                    });
                                  },
                                  child:  Icon(MIcons.gengduo,size: 20.0,color: Color(0xFFA4A2A2),),
                                )
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
           isChecked? InkWell(child: Container(
              //  width: MediaQuery.of(context).size.width,
              height: 147.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0,0,0,.5),
                  borderRadius: BorderRadius.circular(3.0)
              ),

              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell( //删除订单
                      onTap:() {
                        HttpUtil().delete('/mp/order/${widget.orderId}').then((val){print(val);});

//                        Future deleteOrder(orderId) async {
//                          var response = await
//                          if(response['success']) {
//                            print('删除成功！');
//                          }
//                        }

                      },
                      child:Container(
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0,color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Text('删除订单',style: TextStyle(fontSize: 13.0,color: Color(0xFFFFFFFF)),),
                      ),
                    ),
                    InkWell( //订单详情
                      onTap:() {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                          return OrderDetails(widget.orderId);
                        }));
                      },
                      child:Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF4493FF),
                            border: Border.all(width: 1.0,color:Color(0xFF4493FF)),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Text('订单详情',style: TextStyle(fontSize: 13.0,color: Color(0xFFFFFFFF)),),
                      ),
                    )
                  ],
                ),
              ),
            ),onTap: () {
              setState(() { //关闭遮罩
                isChecked = false;
              });
            },):Container()
          ],
        ),
      ],
    );
  }

  //删除订单弹窗
  Future<bool> deleteOrder() {
    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title:Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Icon(MIcons.err,size: 40.0,color: Color(0xFF5E69FC),),
                  ),
                  Text('你是否确定要删除订单？确认删除后将不能找回哦！',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor),textAlign: TextAlign.center,),
                  Container(
                    margin: EdgeInsets.only(top:10.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
//                      width: 100.0,
                          margin: EdgeInsets.only(right: 20.0,),
                          decoration: BoxDecoration(
                              color: Color(0xFFB1B0B0),
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child:FlatButton(
                            child: Text('取消',style: TextStyle(color: Color(0xFFFFFFFF))),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                        ),
                        Container(
//                      width: 100.0,
                          margin: EdgeInsets.only(),
                          decoration: BoxDecoration(
                              color: Color(0xFF4482FF),
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child:FlatButton(
                            child: Text('确认',style: TextStyle(color: Color(0xFFFFFFFF)),),
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
        ));
  }
}