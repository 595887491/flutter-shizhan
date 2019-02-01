import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';

class Address extends StatelessWidget {

  final String title;

  Address(this.title);

  @override
  Widget build(BuildContext content) {
    return  Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              MIcons.dingwei,
              size: 18.0,
              color: Color.fromRGBO(68, 130, 255, 1),
            ),
          ),
          Text(
            this.title,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
