import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
class PackingNumber extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
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
                        padding: EdgeInsets.only(left:10.0,right: 10.0),
                        height: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFF4482FF),
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child:TextField(
                          enabled: true,
                          maxLength: 7,
                          keyboardType: TextInputType.emailAddress,
                          style:TextStyle(
                            color: MTheme.sizeColor,
                            fontSize: 30.0,
                            letterSpacing: 25.0
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none, //不要边框，使用container的边框
                          ),
                          onChanged: (newValue) {
                             print(newValue.length);
                             if(newValue.length>=7){
                               FocusScope.of(content).requestFocus(FocusNode());
                             }// 当输入内容变更时,如何处理
                          },
                        ) ,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      MIcons.err,
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
}
