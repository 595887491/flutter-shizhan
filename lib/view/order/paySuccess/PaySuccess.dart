import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';

class PaySuccess extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaySuccessState();
  }
}

class PaySuccessState extends State<PaySuccess>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MAppBar(
        isgoback: false,
        title: Text('支付成功'),
      ).build(context),
      body: Container(
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
              payMsg()
            ],
          ),
        ),
      ),
    );
  }

  //应付金额
  Widget payMoney() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top:40.0,bottom:40.0),
          decoration:BoxDecoration(
              border: Border(
                top: BorderSide(width: 0, color: Color(0x66ffffff)),
                left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF4482FF)),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Image.asset('assets/images/paySuccess.png',width: 150.0,height:110,),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:15.0,bottom: 5.0),
                child: Text('支付成功',style: TextStyle(fontSize: 16.0,color:MTheme.sizeColor,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(top:5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('￥',style: TextStyle(fontSize: 24.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500)),
                    ),
                    Text('5',style: TextStyle(fontSize: 34.0,color: MTheme.sizeColor,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          )
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

  //应付金额
  Widget payMsg() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30.0),
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
                      child: Text('高新区广都上街石油小区外辅道中段左侧',
                        style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 74.0,
                      child: Text('车 位 号：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666),letterSpacing: 1.0),),
                    ),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(top:3.0),child: Text('A-056', style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 74.0,
                      child: Text('车 牌 号：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666),letterSpacing: 1.0),),
                    ),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(top:3.0),child: Text('京Q32716', style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 74.0,
                      child: Text('开始时间：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                    ),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(top:3.0),child: Text('2018-09-05 10:23:36', style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 74.0,
                      child: Text('结束时间：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                    ),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(top:3.0),child: Text('2018-09-05 10:23:36', style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 74.0,
                      child: Text('停车时长：',style: TextStyle(fontSize: 14.0,color:Color(0xFF666666)),),
                    ),
                    Expanded(
                        child: Padding(padding: EdgeInsets.only(top:3.0),child: Text('5小时52分', style: TextStyle(fontSize: 14.0,color:MTheme.sizeColor),),)
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