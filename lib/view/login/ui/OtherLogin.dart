import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';

class OtherLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 100.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Color(0xff51c232),
                ),
                child: Icon(
                  MIcons.weix,
                  color: Color(0xffffffff),
                  size: 35,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Color(0xff299cd5),
              ),
              child: Icon(
                MIcons.qq,
                color: Color(0xffffffff),
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
