import 'package:flutter/material.dart';

class RecordCard extends StatefulWidget{
  final id; //1
  final createdAt;
  final topUpNum;
  final status;

  RecordCard({
    Key key,
    this.id,
    this.createdAt,
    this.topUpNum,
    this.status
  }) :super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecordCardState();
  }
}

class RecordCardState extends State<RecordCard> {
  String topUpNum;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    topUpNum = '${widget.topUpNum}'; //转换类型

    return  new Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: Row(
          children: <Widget>[
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.status['type'] ?'充值成功': '充值失败',textAlign: TextAlign.left,style: TextStyle(color:widget.status['type']  ? Color(0xFF333333) : Color(0xFFFF6D6D),fontSize:16.0)),
                  Container(
                    margin: EdgeInsets.only(top:3.0),
                    child: Text(widget.createdAt,style: TextStyle(color:Color(0xFF999999),fontSize:12.0),),
                  )
                ],
              ),
            ),
            Expanded(
              child:Text(topUpNum,style: TextStyle(color:Color(0xFF333333),fontSize:16.0),textAlign: TextAlign.right,),
            )
          ],
        ),
      ),
    );;
  }
}