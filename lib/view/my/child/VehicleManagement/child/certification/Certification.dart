import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";
import 'ui/Layout.dart';

class Certification extends StatelessWidget {
  final String id;

  Certification({Key key,this.id}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text(
          '车辆认证',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        isgoback: true,
      ).build(context),
      body: Container(
        child: Layout(
          id: this.id,
        ),
      ),
    );
  }
}
