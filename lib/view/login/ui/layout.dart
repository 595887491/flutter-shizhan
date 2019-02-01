import "package:flutter/material.dart";
import 'package:kaka_flutter_mp/style/MTheme.dart';

import 'FormPage.dart';
import 'OtherLogin.dart';

class Layout extends StatefulWidget {
  @override
  _Layout createState() => _Layout();
}

class _Layout extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 96.0, bottom: 50.0, left: 15.0, right: 15.0),
            child: Text(
              '手机号登录',
              style: TextStyle(
                fontSize: 25.0,
                color: MTheme.sizeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// 表单模块
          FormPage(),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '登录即同意',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF222222),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '《用户信息协议》',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF4482FF),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 50.0, bottom: 20.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCCCCCC), width: .5)),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  child: Text(
                    '其它登录方式',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.0, color: Color(0xFF999999)),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCCCCCC), width: .5)),
                )
              ],
            ),
          ),

          /// 其他方式登录模块
          OtherLogin(),
        ],
      ),
    );
  }
}
