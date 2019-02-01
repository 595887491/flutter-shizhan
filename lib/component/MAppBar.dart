import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/style/MTheme.dart";
import 'package:kaka_flutter_mp/style/MIcon.dart';

class MAppBar extends StatelessWidget {
  // 标题
  final Text title;
  // 是否有返回键
  final bool isgoback;

  final GestureTapCallback clickgoback;
  // final String
  MAppBar({Key key, this.title, this.isgoback,this.clickgoback}) : super();

  @override
  Widget build(BuildContext context) {
    // 是否有左边返回键
    Widget goback;
    if (isgoback != null) {
      goback = InkWell(
        child: IconButton(
            icon: Icon(
              MIcons.leftjiantou,
              color: Color.fromRGBO(255, 255, 255, 1.0),
            ),
            onPressed: null),
        onTap:this.clickgoback==null?(){
          Navigator.pop(context);
        }:this.clickgoback,
      );
    }

    // return 出去
    return PreferredSize(
      child: AppBar(
        leading: goback,
        centerTitle: true,
        title: this.title,
        backgroundColor: MTheme.themeColor,
        elevation: 0.0,
      ),
      preferredSize: Size.fromHeight(44),
    );
  }
}
