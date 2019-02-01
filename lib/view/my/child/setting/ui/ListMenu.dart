import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';

class ListMenu extends StatefulWidget {
  final Text title;
  final GestureTapCallback click;
  final Container content;

  ListMenu({Key key, this.title, this.click, this.content}) : super(key: key);

  @override
  _ListMenu createState() => new _ListMenu();
}

class _ListMenu extends State<ListMenu> {
  Color clickcolor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          clickcolor = Color(0xFFFFFFFF);
        });
        widget.click();
      },
      onTapDown: (pragma) {
        setState(() {
          clickcolor = Color(0xFFeeeeee);
        });
        print(pragma);
        print("______________-");
      },
      onTapCancel: () {
        setState(() {
          clickcolor = Color(0xFFFFFFFF);
        });
        print("*********************8");
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: clickcolor,
        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: widget.title,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: widget.content,
            ),
            Icon(
              MIcons.rightjiantou,
              color: Color(0xFFB3B3B3),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
