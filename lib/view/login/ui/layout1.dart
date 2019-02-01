import "package:flutter/material.dart";
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/view/index/Index.dart';
import 'package:kaka_flutter_mp/view/login/ui/WxLogin.dart';

import 'GetCode.dart';

class Layout extends StatefulWidget {
  @override
  _Layout createState() => _Layout();
}

class _Layout extends State<Layout> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// form表单的两个字段
  String _phone;
  String _code;
  bool isInputPhone = false;
  bool isInputCode = false;
  bool isgetCode = false; //是否发送验证码

  RegExp phoneRegExp = new RegExp('^1\\d{10}\$'); //验证手机号码正则
  RegExp codeRegExp = new RegExp('^\\d{6}\$'); //验证验证码的正则
  TextEditingController phone_controller = new TextEditingController();
  TextEditingController code_controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone_controller.addListener(() {
      if (phone_controller.value.text != '') {
        //监听是否输入值
        this.isInputPhone = true;
      } else {
        setState(() {
          this.isInputPhone = false;
        });
      }

      if (phoneRegExp.stringMatch(phone_controller.value.text) != null) {
        setState(() {
          this.isgetCode = true;
        });
      } else {
        setState(() {
          this.isgetCode = false;
        });
      }
    });
    code_controller.addListener(() {
      //监听是否输入值
      if (code_controller.value.text != '') {
        this.isInputCode = true;
      } else {
        this.isInputCode = false;
      }
    });
  }

  void getCode() {
    //获取验证码api
    if (phoneRegExp.stringMatch(phone_controller.value.text) != null) {
      print('*****');
      print(phoneRegExp.stringMatch(phone_controller.value.text));
      setState(() {
        this.isgetCode = true;
      });
    } else {
      showDialog(
          context: context,
          builder: (ctx) => new AlertDialog(
                title: Text('错误'),
                content: new Text('请输入正确的手机号码'),
                actions: <Widget>[
                  FlatButton(
                    child:
                        Text('确定', style: TextStyle(color: Color(0xFF4482FF))),
                    onPressed: () => Navigator.pop(ctx, true),
                  ),
                ],
              ));
    }
  }

  //登录
  void _onSubmit() {
    final form = _formKey.currentState;
    print(isInputPhone);
    print(isInputCode);

    if (form.validate()) {
      form.save();
      print(_phone);
      if (_phone == null) {
        showDialog(
            context: context,
            builder: (ctx) => new AlertDialog(
                  title: Text('错误'),
                  content: new Text('请输入手机号码'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('确定',
                          style: TextStyle(color: Color(0xFF4482FF))),
                      onPressed: () => Navigator.pop(ctx, true),
                    ),
                  ],
                ));
      } else if (_code == null) {
        showDialog(
            context: context,
            builder: (ctx) => new AlertDialog(
                  title: Text('错误'),
                  content: new Text('请输入验证码'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('确定',
                          style: TextStyle(color: Color(0xFF4482FF))),
                      onPressed: () => Navigator.pop(ctx, true),
                    ),
                  ],
                ));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Index()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80.0, bottom: 50.0, left: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '手机号登录',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: MTheme.sizeColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 0, color: Color(0x66ffffff)),
                        left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFCCCCCC)),
                      )),
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
                              onSaved: (val) {
                                this._phone = phoneRegExp.stringMatch(val);
                              },
                              controller: phone_controller,
                              keyboardType: TextInputType.number,
                              validator: (val) => (val == null || val.isEmpty)
                                  ? "请输入手机号码"
                                  : null,
                              decoration: InputDecoration(
                                hintText: '请输入手机号码',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xFF999999),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 0, color: Color(0x66ffffff)),
                        left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFCCCCCC)),
                      )),
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
                              onSaved: (val) {
                                this._code = codeRegExp.stringMatch(val);
                              },
                              controller: code_controller,
                              keyboardType: TextInputType.number,
                              validator: (v) =>
                                  (v == null || v.isEmpty) ? "请输入验证码" : null,
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
                                countdown: 60,
                                onTapCallback: getCode,
                                available: isgetCode,
                              )
//                              Text('获取验证码',style: TextStyle(fontSize: 18.0,color: Color(0xFF4482FF),fontWeight: FontWeight.w500),),
                              ),
                        ],
                      ),
                    ),
                    isInputPhone && isInputCode
                        ? InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: MButton(
                                      button: Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                          child: InkWell(
                                            onTap: _onSubmit,
                                            child: Text(
                                              '登录',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        : Container(
                            margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 45.0,
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFCCCCCC),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0.0, 0.0),
                                            color: Color(0xFFEEEEEE),
                                            blurRadius: 1.0,
//                                    spreadRadius: 1.0
                                          )
                                        ]),
                                    child: Text(
                                      '登录',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('登录即同意',
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF222222))),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              '《用户信息协议》',
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF4482FF)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFCCCCCC), width: .5)),
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              '其它登录方式',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.0, color: Color(0xFF999999)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFCCCCCC), width: .5)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WxLogin()));
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 100.0),
                                child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  fit: BoxFit.fill,
                                  width: 50.0,
                                  height: 50.0,
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                child: Image(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill,
                              width: 50.0,
                              height: 50.0,
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
