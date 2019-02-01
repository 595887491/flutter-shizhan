import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:fluwx/fluwx.dart' as fluwx;  //微信支付
import 'dart:async';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'dart:io' as H;
import 'dart:convert';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:kaka_flutter_mp/component/flutter_alipays.dart';

class UnfinishList extends StatefulWidget{
  final carNum;
  final stopTime;
  final money;
  final stopArea;
  final streetName;
  final areaName;
  final orderId;
  final stopDay;

  UnfinishList({Key key,this.carNum,this.stopTime,this.money,this.stopArea,this.streetName,this.areaName,this.orderId,this.stopDay}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UnfinishListState();
  }
}


class UnfinishListState extends State<UnfinishList> {
  String timer; //停车时长
  String moneys; //停车金额

  String _payInfo = "";
  AlipayResult _payResult;

  String _url = "https://wxpay.wxutil.com/pub_v2/app/app_pay.php";  //请求微信支付 参数数据地址；
  String _result = "无";

  @override
  initState() {
    super.initState();
//    getWxParams();
    //appId：在微信平台申请的appId。
    fluwx.register(appId: "wxd930ea5d5a258f4f", doOnAndroid: true, doOnIOS: true, enableMTA: false); //初始化微信支付
    fluwx.responseFromPayment.listen((data) {
      setState(() {
        _result = "${data.errCode}";
      });
    });
  }

  Future callAlipay() async { //支付宝支付
    dynamic payResult;
    try {
      print("The pay info is : " + _payInfo);
      payResult = await FlutterAlipay1.pay(_payInfo);
      print('******');
      print(payResult);
    } on Exception catch (e) {
      payResult = null;
      print('******');
      print(payResult);
    }

    if (!mounted) return;

    setState(() {
      _payResult = payResult;
    });
  }

Future getWxParams() async{  //微信支付
  var h = H.HttpClient();
  h.badCertificateCallback = (cert, String host, int port) {
    return true;
  };
  var request = await h.getUrl(Uri.parse(_url));
  var response = await request.close();
  var data = await response.transform(Utf8Decoder()).join();
  Map<String, dynamic> result = json.decode(data);
   print(result);
  print(result['appid']);
  print(result["timestamp"]);
  fluwx.pay(
    appId: result['appid'].toString(),
    partnerId: result['partnerid'].toString(),
    prepayId: result['prepayid'].toString(),
    packageValue: result['package'].toString(),
    nonceStr: result['noncestr'].toString(),
    timeStamp: result['timestamp'],
    sign: result['sign'].toString(),
  )
      .then((data) {
    print("---》$data");
  });
}

  @override
  Widget build(BuildContext context) {
    if(int.parse(widget.stopTime) >= 60 ) {
      timer = '停车时长：${(int.parse(widget.stopTime)/60).floor()}小时 ${int.parse(widget.stopTime)%60}分';
    }else{
      timer = '停车时长：${int.parse(widget.stopTime)}分';
    }

    moneys ='${int.parse(widget.money)/100}';

    // TODO: implement build
    return  new Card(
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
                    Text(timer ,style: TextStyle(fontSize: 13.0,color: Color(0xFF666666)),),
                  ],
                ),
                Expanded(
                    child: Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
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
//                width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(width: .5,color: Color(0xFFE5E5E5))
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
            child: Row(
              children: <Widget>[
                Text(widget.stopDay,style: TextStyle(fontSize: 12.0,color: Color(0xFF999999),fontWeight: FontWeight.w500),),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child:InkWell(
                          onTap: goPay,
                          child: MButton(
                            button:Container(
                              padding: EdgeInsets.fromLTRB(30.0,12.0,30.0,12.0),
                              child: Text('去支付',
                                style: TextStyle(fontSize: 13.0,color: MTheme.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ),
                        )
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //支付方式弹窗
  Future<bool> goPay() {
    return showDialog(
        context: context,
        builder: (context) {
          int rvalue = 0;
          return StatefulBuilder(
            builder: (context, state) {
//              print('label = $label');
              return GestureDetector(
                  child:SimpleDialog(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0, color: Color(0x66ffffff)),
                                left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                                right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                                bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                              )
                          ),
                          child:Container(
                            padding: EdgeInsets.only(left: 15.0,bottom: 12.0),
                            child: Text('支付方式',style: TextStyle(fontSize: 17.0,color: MTheme.sizeColor,fontWeight: FontWeight.w800),),
                          )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15.0,right: 10.0),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                state(() { rvalue = 1;});
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
                                        onChanged: (value) { state(() { rvalue = value;});},
                                        activeColor: Color(0xFF4482FF),),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async{
                                state(() { rvalue = 2;});
                                getWxParams();
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
                                        onChanged: (value) { state(() { rvalue = value;});},
                                        activeColor: Color(0xFF4482FF),),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                state(() { rvalue = 3;});
                                callAlipay(); //支付宝支付
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
                                        onChanged: (value) { state(() { rvalue = value;});},
                                        activeColor: Color(0xFF4482FF),),
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              );
            },
          );
        });
  }
}