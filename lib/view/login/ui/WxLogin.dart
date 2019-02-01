import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

class WxLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFEDEDED)),
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () { Navigator.pop(context);},
            child: Container(
              padding: EdgeInsets.only(top:17.0,left: 15.0),
              child: Text('关闭',style: TextStyle(fontSize: 18.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
            ),
          ),
          elevation: 0.0, //去掉阴影
        ),
        body: Page(context),
      )
    );
  }
  Widget Page(context) {
    return Column(
      children: <Widget>[
       Container(
         margin: EdgeInsets.only(left: 30.0,right: 30.0),
         decoration: BoxDecoration(
           border: Border(
             top: BorderSide(width: 0, color: Color(0x66ffffff)),
             left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
             right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
             bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
           )
         ),
         child: Column(
           children: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.only(top:40.0),
                   child: Image(
                     image:AssetImage("assets/images/logo.png"),
                     fit:BoxFit.cover,
                     width: 80.0,
                     height: 80.0,
                   ),
                 ),],
             ),
             Container(
                 padding: EdgeInsets.only(top:10.0,bottom: 30.0),
                 child:Text('易智停',style: TextStyle(fontSize: 20.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),)
             ),
           ],
         ),
       ),
        Container(
          margin: EdgeInsets.only(left: 30.0,right: 30.0),
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top:20.0,bottom: 20.0),
                  child:Text('登陆后应用将获得以下权限',style: TextStyle(fontSize: 16.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),textAlign: TextAlign.left,)
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.only(right: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color(0xFFAAAAAA)
                    ),
                  ),
                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text('获得你的公开信息（昵称、头像、地区及性别）', style: TextStyle(
                          fontSize: 16.0, color: Color(0xFFAAAAAA),
                          fontWeight: FontWeight.w500),
                        maxLines: 3,
                        textAlign: TextAlign.left,)
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child:Padding(padding: EdgeInsets.fromLTRB(15.0,30.0,15.0,0.0),
                child:  RaisedButton(
                  onPressed: () {},
                color: Color(0xFF07C160),
                padding: EdgeInsets.all(14.0),
                child: Text('确认登录',style: TextStyle(fontSize: 20.0),),
                textColor: Color(0xFFFFFFFF),
              ),)
            )

          ],
        )

      ],
    );
  }
}