import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';



class HeaderMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(child:
            Container(
//              color: MTheme.themeColor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF52D0FE), MTheme.themeColor],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width:64.0,
                    height: 64.0, margin:EdgeInsets.only(top: 35.0,bottom: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64.0),
                        color: Color.fromRGBO(255, 255, 255, 0.5)
                    ),
                    alignment: Alignment.center,
                    child:ClipOval(
                      child: Container(
                        width: 58.0,
                        height: 58.0,
                        child: new Image.asset( "assets/images/header.jpg",),
                      ),
                    )
                  ),
                  Container(
                      alignment: Alignment.center,
                      child:Text("妮儿~bbp",style: TextStyle(
                        color: MTheme.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                  Image(
                    image:AssetImage("assets/images/mybg.png"),
                    fit:BoxFit.scaleDown,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
