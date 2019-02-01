import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

class Message extends StatefulWidget {
  final int type;  //类型
  final String date; // 时间
  final String text; // 内容
  final bool isRead; // 是否阅读

  Message({Key key,this.type=0,@required this.text,@required this.date,this.isRead=false}):super(key:key);

  @override
  _Message createState() => new _Message();
}

class _Message extends State<Message> {


  @override
  Widget build(BuildContext content) {

    List<Map> icon=[
      {"color": [ Color(0xFF52D0FE), Color(0xFF5A83FD),],
        "title": "系统消息",
        "icon": MIcons.laba,},
      {
        "color": [ Color(0xFF45F6B7), Color(0xFF17C788),],
        "title": "订单消息",
        "icon": MIcons.dingd,
      }

    ];

    List<Color> colors=icon[widget.type]['color'];;
    String title=icon[widget.type]['title'];
    IconData iconfont=icon[widget.type]['icon'];;


















      return Container(
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(right: 13.0),
            width: 40.0,
            height: 40.0,
            child: Icon(
              iconfont,
              color: MTheme.white,
              size: 25.0,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-85.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.start,
                    ),),
                    Text(
                      widget.date,
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width - 85.0,
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
