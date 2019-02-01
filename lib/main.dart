import "package:flutter/material.dart";
import 'package:kaka_flutter_mp/view/index/Index.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "智慧停车APP",
      home: Index(),
    );
  }
}
