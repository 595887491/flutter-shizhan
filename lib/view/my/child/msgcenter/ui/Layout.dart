import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'Message.dart';
class Layout extends StatefulWidget{

  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout> {

  List<Map> atatbase=[
    {
      "type": 0,
      "text":"智慧停车新版上线，用户停车即可享受首单免单",
      "date":"2018-9-8"
    },
    {
      "type":1,
      "text":"您有一笔新的订单未完成支付",
      "date":"2018-9-8"
    },{
      "type": 0,
      "text":"智慧停车8.18会员券惠日，消费满100即送10元",
      "date":"2018-9-8"
    },{
      "type": 0,
      "text":"智慧停车8.18会员券惠日，消费满100即送10元",
      "date":"2018-9-8"
    },{
      "type":1,
      "text":"您刚刚通过余额支付完成一笔订单。",
      "date":"2018-9-8"
    }
  ];



  List<Widget> getSowList (){
    List<Widget> showList = [];

    for(Map item in this.atatbase){
        showList.add(
            Message(
              type: item["type"],
              date: item["date"],
              text: item["text"],
            )
        );
        showList.add(Divider(
          height: 1.0,
          indent:15.0,
          color: Color.fromRGBO(229, 229, 229, 1),
        ));
    }
    return showList;
  }



  @override
  Widget build(BuildContext content) {
    return ListView(
      padding: EdgeInsets.only(top: 10.0),
      children: getSowList(),
    );
  }
}
