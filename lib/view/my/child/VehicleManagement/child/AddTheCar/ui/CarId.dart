import 'package:flutter/material.dart';

import 'package:kaka_flutter_mp/style/MIcon.dart';

import 'package:kaka_flutter_mp/style/MTheme.dart';

class CarId extends StatefulWidget {
  final callback;

  String plateNumber;
  int carType;

  CarId({Key key, this.plateNumber, this.callback,this.carType}) : super(key: key);

  _CarId createState() => _CarId();
}

class _CarId extends State<CarId> {
  bool lightning = false;

  @override
  Widget build(BuildContext content) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "请输入车牌号：",
                  style: TextStyle(fontSize: 14.0),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10.0,
                        ),
                        height: 55.0,
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Color.fromRGBO(68, 130, 255, 1),
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: TextField(
                          controller: TextEditingController(
                              text: widget.plateNumber),
                          enabled: true,
                          maxLength:widget.carType==0?7:8,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: MTheme.sizeColor,
                              fontSize: 25.0,
                              letterSpacing: 25.0),
                          decoration: InputDecoration(
                            border:
                            InputBorder.none, //不要边框，使用container的边框
                          ),
                          onChanged: (newValue) {

                            if (newValue.length >= (widget.carType==0?7:8)) {
                              widget.callback(newValue, widget.carType);
                              FocusScope.of(content)
                                  .requestFocus(FocusNode());
                            } // 当输入内容变更时,如何处理
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                          child: widget.carType!=0
                              ? Icon(
                                  MIcons.checked,
                                  color: MTheme.themeColor,
                                  size: 16.0,
                                )
                              : Icon(
                                  MIcons.nochecked,
                                  color: Color(0xFFCCCCCC),
                                  size: 16.0,
                                ),
                        ),
                        onTap: () {
                          setState(() {
                            if(widget.carType==0){
                              widget.carType=1;
                            }else{
                              widget.carType=0;
                            }
                            widget.callback(widget.plateNumber, widget.carType);
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "新能源车辆",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF4482FF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if(widget.carType==0){
                              widget.carType=1;
                            }else{
                              widget.carType=0;
                            }
                            widget.callback(widget.plateNumber, widget.carType);
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
