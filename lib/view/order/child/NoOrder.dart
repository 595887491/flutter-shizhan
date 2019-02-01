import 'package:flutter/material.dart';

class NoOrder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/notOrder.png',width: 200.0,height:110,)
          ],
        ),
        Container(
          child: Text('空空如也',style: TextStyle(fontSize: 15.0,color:Color(0xFF53A6F6),fontWeight: FontWeight.w500),),
        ),
        Container(
          margin: EdgeInsets.only(top:5.0),
          child: Text('你是勤劳的好小孩，订单都被你处理完啦！',style: TextStyle(fontSize: 11.0,color:Color(0xFF999999),fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}