import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";
import 'ui/Layout.dart';

class MsgCenter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          '消息中心',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        isgoback: true,
      ).build(context),
      body: Container(
        child: Layout(),
      ),
    );
  }
}