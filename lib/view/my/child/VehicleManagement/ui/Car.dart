import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

import '../child/certification/Certification.dart';
import 'DialogDelete.dart';

class Car extends StatelessWidget {
  final String carId;
  final String plateNumber;
  final bool authentication;
  final GestureDetector delete;

  Car({Key key,
    this.carId,
    this.plateNumber,
    this.authentication = false,
    this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext content) {
    Widget divider;
    Widget authenticationText;
    String carType;
    Widget authenticationIcon = Container();
    // 判断是否认证
    if (!authentication) {
      divider = Divider(
        height: 1.0,
        color: Color.fromRGBO(229, 229, 229, 1),
      );

      authenticationText = Container(
        padding:
        EdgeInsets.only(left: 15.0, top: 13, right: 15.0, bottom: 13.0),
        child: Row(
          children: <Widget>[
            Text(
              "您可以申请",
              style: TextStyle(fontSize: 11.0, color: Color(0xFF333333)),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    content,
                    MaterialPageRoute(
                      builder: (context) =>
                          Certification(
                            id: carId,
                          ),
                    ),
                  );
                },
                child: Text(
                  "车辆认证",
                  style: TextStyle(fontSize: 11.0,
                      color: Color(0xFFFF6D6D),
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Text(
              "，以便更方便享受停车服务。",
              style: TextStyle(fontSize: 11.0, color: Color(0xFF333333)),
            ),
          ],
        ),
      );
    } else {
      // 已认证图标
      authenticationIcon = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: MTheme.gradient,
          ),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Text(
          "已认证",
          style: TextStyle(
            color: MTheme.white,
            fontSize: 11.0,
          ),
        ),
      );
      divider = Container();
      authenticationText = Container();
    }

    // 通过车牌判断车辆类型
    if (plateNumber.length == 7) {
      carType = "燃油车";
    } else if (plateNumber.length == 8) {
      carType = "新能源车";
    } else {
      carType = "未知车辆";
    }

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      // 卡片效果
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(-2.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        this.plateNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      authenticationIcon,
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog<Null>(
                        context: content, //BuildContext对象
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return DialogDelete(
                            //调用对话框
                            id: this.carId,
                          );
                        });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MIcons.delete,
                          color: Color(0xFF333333),
                          size: 16.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "删除",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: 15.0, top: 25, right: 15.0, bottom: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(carType),
          ),
          divider,
          authenticationText,
        ],
      ),
    );
  }
}
