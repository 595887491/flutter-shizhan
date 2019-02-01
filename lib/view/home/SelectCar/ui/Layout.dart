import 'package:flutter/material.dart';

import 'package:kaka_flutter_mp/style/icon.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

class Layout extends StatelessWidget {
  // 地址
  Widget getAddress() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              MyIcons.icon1,
              size: 18.0,
              color: Color.fromRGBO(68, 130, 255, 1),
            ),
          ),
          Text(
            "南外区/交警二大队停车点",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  // 停车编号
  Widget getPackingNumber() {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "泊车位编号：",
                  style: TextStyle(fontSize: 14.0),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        height: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: Color(0xFF4482FF),
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      MyIcons.icon1,
                      color: Color(0xFFFCAC01),
                      size: 14.0,
                    ),
                    Expanded(
                      child: Text(
                        "请输入地面上标记的7位泊车数字",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 车牌信息
  Widget selectCarId() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Text(
              "最近所泊车辆：",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF999999),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: const Color(0xFFeeeeee),
                  offset: new Offset(-2.0, 1.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(15.0, 23.0, 15.0, 23.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 4.0,
                      height: 15.0,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: MTheme.themeColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "京Q32716",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    Icon(
                      MyIcons.icon1,
                      color: Color(0xFFFCAC01),
                      size: 18.0,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.0, top: 14.0),
                  alignment: Alignment.centerLeft,
                  child: Text("燃油车"),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: const Color(0xFFeeeeee),
                  offset: new Offset(-2.0, 1.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(15.0, 23.0, 15.0, 23.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 4.0,
                      height: 15.0,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: MTheme.themeColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "京Q32716",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    Icon(
                      MyIcons.icon1,
                      color: Color(0xFFFCAC01),
                      size: 18.0,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.0, top: 14.0),
                  alignment: Alignment.centerLeft,
                  child: Text("燃油车"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext content) {
    return ListView(
      children: <Widget>[
        getAddress(),
        Divider(
          height: 1.0,
          color: Color.fromRGBO(229, 229, 229, 1),
        ),
        getPackingNumber(),
        Divider(
          height: 1.0,
          color: Color.fromRGBO(229, 229, 229, 1),
        ),
        selectCarId(),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MButton(
                  button: Container(
                    padding: EdgeInsets.all(12.0),
                    alignment: Alignment.center,
                    child: Text(
                      "确认停车",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: null,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: MTheme.themeBGColor,
                      border: Border.all(
                        width: 1.0,
                        color: MTheme.themeColor,
                      ),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: const Color(0xFF999999),
                          offset: new Offset(-2.0, 1.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      alignment: Alignment.center,
                      child: Text(
                        "确认停车",
                        style: TextStyle(
                          color: MTheme.themeColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
