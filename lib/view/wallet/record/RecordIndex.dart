import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import '../../../style/MTheme.dart';
import '../order/Orders.dart';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart'; //加载动画
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kaka_flutter_mp/model/Record.dart';
import '../child/RecordCard.dart';

class RecordIndex extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecordIndexState();
  }
}

class RecordIndexState extends State<RecordIndex>{
  var total;  //分页数据
  List<dynamic> datas=[];
  List<Widget> recordCard=[];
  Widget content;    //全部内容
  Widget contexts; //充值内容
  bool isRequest = false; //是否已经请求完毕

  Future getData() async{
    isRequest = false;
    var response = await HttpUtil().get('/mp/topUp', data:{});
    if(response['success']) {
     print(response['result']);
     isRequest = true;
     SharedPreferences pageCount = await SharedPreferences.getInstance(); //存储分页
     total = pageCount.getInt('Unfinishordertotal'); //存储页数

     setState(() {
       datas = response['result']['records'].map((json) => Record.fromJson(json)).toList();
     });
     print('*******');
     print(datas);
    }
  }
  List<Widget> carList() {
//    finishedLists=[];
    for(Record item in datas) {
      var vv = item.toJson();
      recordCard.add(
        RecordCard(
          id:vv['id'],
          createdAt:vv['createdAt'],
          topUpNum: vv['topUpNum'],
          status :vv['status'],
        ));
    }
    return recordCard;
  }
  @override
  void initState() {
    getData().then((val) {
      carList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!isRequest) {
      content = Container(child:SpinKitFadingCircle(color: Color.fromRGBO(0, 0, 0, .5), size: 50.0,)); //加载动画
    }else{
      if(this.datas.length>0){
        content = Container(
            color: Color(0xFFEEEEEE),
            padding: EdgeInsets.all(10.0),
            child:Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  child:  ListView(
                    children: carList(),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top:10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                          return Orders();
                        }));
                      },
                      child:Text('开发票',style: TextStyle(fontSize: 14.0,color: Color(0xFF4482FF),decoration: TextDecoration.underline),),
                    )
                )
              ],
            )
        );
      }else if(this.datas.length == 0){
        content = Container(
            color: Color(0xFFEEEEEE),
            padding: EdgeInsets.all(10.0),
            child:Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image(
                                  image: AssetImage("assets/images/notRecord.png"),
                                  width: 105.0,
                                  height: 115.0,
                                  fit:BoxFit.fill
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:15.0,bottom: 55.0),
                              child: Text('暂无充值记录哦~',style: TextStyle(fontSize: 15.0,color: Color(0xFF53A6F6)),),
                            ),
                            MButton(
                                button:Container(
                                  padding: EdgeInsets.fromLTRB(30.0,12.0,30.0,12.0),
                                  child: Text('去充值',
                                    style: TextStyle(fontSize: 13.0,color: MTheme.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top:10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                          return Orders();
                        }));
                      },
                      child:Text('开发票',style: TextStyle(fontSize: 14.0,color: Color(0xFF4482FF),decoration: TextDecoration.underline),),
                    )
                )
              ],
            )
        );
      }
    }
    return Scaffold(
      appBar: MAppBar(
        title: Text('充值记录',style: TextStyle(
          fontSize: 18,
        ),),
        isgoback: true,
      ).build(context),
      body:content
    );
  }

}