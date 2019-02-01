import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

import 'GetCode.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPage createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70.0,
                    child: Text(
                      '+86',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: MTheme.sizeColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100.0,
                    child: TextFormField(
                      onSaved: (val) {},
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入手机号码',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70.0,
                    child: Text(
                      '验证码',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: MTheme.sizeColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200.0,
                    child: TextFormField(
                      onSaved: (val) {},
                      controller: codeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入验证码',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: GetCode(
                      onTapCallback: () {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MButton(
                      dislable: true,
                      button: Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            '登录',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
