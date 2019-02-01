import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";

import 'ui/Layout.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          '设置',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        isgoback: true,
      ).build(context),
      body: Container(
        color: Color(0xffeeeeee),
        child: Layout(),
      ),
    );
  }
}
