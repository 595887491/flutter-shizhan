import "package:flutter/material.dart";
import "package:kaka_flutter_mp/component/MAppBar.dart";
import './ui/Layout.dart';

/**
 * 选中车辆页面
 * 静态
 */
class SelectCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          '选择车辆',
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
