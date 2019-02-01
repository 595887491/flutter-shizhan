import 'package:flutter/material.dart';
import 'dart:math';

class Keyboard extends StatelessWidget{
  final String data;
  Keyboard(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustom(this.data),
    );
  }
}


class MyCustom extends CustomPainter{
  String pwdLength;

  MyCustom(this.pwdLength);

  @override
  void paint(Canvas canvas, Size size) {
    // 初始化

    Paint mPwdPaint;
    Paint mRectPaint;

    // 初始化笔画
    mPwdPaint = new Paint();
    mPwdPaint..color = Colors.black;
    // 初始化输入框
    mRectPaint = new Paint();
    mRectPaint..color=Color(0xff707070);
    // 绘制圆角矩形
    RRect r = new RRect.fromLTRBR(0.0, 0.0, size.width, size.height, new Radius.circular(size.height/12));

    mRectPaint.style = PaintingStyle.stroke;
    canvas.drawRRect(r, mRectPaint);

    ///  将其分成六个 格子（六位支付密码）
    var per = size.width / 6.0;
    var offsetX = per;
    while (offsetX < size.width) {
      canvas.drawLine(
          new Offset(offsetX, 0.0), new Offset(offsetX, size.height), mRectPaint);
      offsetX += per;
    }

    ///  画实心圆
    var half = per/2;
    var radio = per/8;
    mPwdPaint.style = PaintingStyle.fill;
    ///  当前有几位密码，画几个实心圆
    for(int i =0; i< pwdLength.length && i< 6; i++){
      canvas.drawArc(new Rect.fromLTRB(i*per+half-radio, size.height/2-radio, i*per+half+radio, size.height/2+radio), 0.0, 2*pi, true, mPwdPaint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}