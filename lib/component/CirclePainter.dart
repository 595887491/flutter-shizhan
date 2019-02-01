import 'package:flutter/material.dart';



class CirclePainter extends CustomClipper<Path> {  //上下拉距离 计算
  final double offset;
  final bool up;
  CirclePainter({this.offset, this.up});
  @override
  Path getClip(Size size) {
// TODO: implement getClip
    final path = new Path();
    if (!up) path.moveTo(0.0, size.height);
    path.cubicTo(
        0.0,
        up ? 0.0 : size.height,
        size.width / 2,
        up ? offset * 2.3 : size.height - offset * 2.3,
        size.width,
        up ? 0.0 : size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
// TODO: implement shouldReclip
    return oldClipper != this;
  }
}
