import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
class ListMenu extends StatefulWidget {

  final IconData icon;
  final String title;
  final GestureTapCallback click;
  ListMenu({Key key,this.icon,this.title,this.click}):super(key:key);

  @override
  _ListMenu createState() => new _ListMenu();
}

class _ListMenu extends State<ListMenu> {
  Color clickcolor= Color(0xFFFFFFFF);


  
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        setState(() {
          clickcolor=Color(0xFFFFFFFF);
        });
        widget.click();
      },
      onTapDown:(pragma){
        setState(() {
          clickcolor=Color(0xFFeeeeee);
        });
        print(pragma);
        print("______________-");
      },
      onTapCancel: (){
        setState(() {
          clickcolor=Color(0xFFFFFFFF);
        });
        print("*********************8");
      },
      child: Container(
        color: clickcolor,
        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
        child: Row(
          children: <Widget>[
            Icon(widget.icon,color:MTheme.themeColor,size: 20,),
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0,right: 15.0),
                  child: Text(widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: MTheme.sizeColor,

                    ),
                  ),
                )
            ),
            Icon(MIcons.rightjiantou,color: Color(0xFFB3B3B3),size: 15,),
          ],
        ),
      ),
    );
  }
}
