import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";
import 'ui/Layout.dart';


// 车辆认证状态

class Achieve extends StatelessWidget{

  final bool status;
  final String title;

  Achieve({Key key,this.title,this.status}):super(key:key);




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
      ).build(context),
      body: Container(
        child: Layout(status: this.status,title: this.title,),
      ),
    );
  }
}
