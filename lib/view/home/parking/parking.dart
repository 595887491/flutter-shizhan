import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";
import 'ui/layout.dart';

class Parking extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          "正在停车",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white
          ),
        ),
        isgoback: true,
      ).build(context),
      body: new Container(
        child: new Layout(),
      ),
    );
  }
}