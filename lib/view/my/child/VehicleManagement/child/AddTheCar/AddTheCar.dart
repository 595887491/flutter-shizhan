import "package:flutter/material.dart";
import "package:kaka_flutter_mp/component/MAppBar.dart";
import './ui/Layout.dart';


class AddTheCar extends StatelessWidget {
  final int type;
  // 路有传过来的参数
  AddTheCar({Key key,this.type}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          '添加车辆',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        isgoback: true,
      ).build(context),
      body: Container(
        child: Layout(type: this.type,),
      ),
    );
  }
}
