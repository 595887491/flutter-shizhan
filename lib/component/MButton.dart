import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/style/MTheme.dart";

class MButton extends StatelessWidget {
  // 标题
  final Container button;
  final GestureTapCallback click;
  final bool dislable;
  // final String
  MButton({Key key, this.button, this.click, this.dislable = false}) : super();

  @override
  Widget build(BuildContext context) {
    // 是否有左边返回键

    // return 出去
    return InkWell(
      onTap: click,
      child: Container(
        decoration: BoxDecoration(
          gradient: !dislable ? LinearGradient(
            colors: MTheme.gradient,
          ) : null,
          color: dislable ? Color(0xFFCCCCCC) : null,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: !dislable ? <BoxShadow>[
            new BoxShadow(
              color: const Color(0xFF999999),
              offset: new Offset(-2.0, 1.0),
              blurRadius: 3.0,
            ),
          ] : null,
        ),
        child: this.button,
      ),
    );
  }
}
