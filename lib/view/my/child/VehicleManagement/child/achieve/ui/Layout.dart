import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import '../../../../vehiclemanagement/VehicleManagement.dart';
class Layout extends StatefulWidget{
  final bool status;
  final String title;

  Layout({Key key,this.title,this.status}):super(key:key);

  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout> {
  @override
  Widget build(BuildContext content) {
    List<Widget> content;
    if(widget.status){
      content = <Widget>[
        Image(
          width: 130.0,
          image: AssetImage("assets/images/success.png"),
        ),
        Container(
          child: Text("恭喜您,车辆认证成功!",style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),),
          padding: EdgeInsets.only(top: 15.0,bottom: 60.0),
        ),
        MButton(
          button: Container(
            padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
            child: Text("返回车辆管理",style: TextStyle(
              color: MTheme.white,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),),
          ),
        )
      ];
    }else{
      content = <Widget>[
        Image(
          width: 130.0,
          image: AssetImage("assets/images/failure.png"),
        ),
        Container(
          child: Text("哦豁，认证失败!",style: TextStyle(
            color: Color(0xFFFD6C6F),
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),),
          padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
        ),
        Container(
          child: Text(widget.title,style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),),
          padding: EdgeInsets.only(bottom: 40.0),
        ),
        MButton(
          click: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VehicleManagement(),
              ),
            );
          },
          button: Container(
            padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
            child: Text("返回车辆管理",style: TextStyle(
              color: MTheme.white,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),),
          ),
        )
      ];
    }
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 11.0),
      alignment: Alignment.center,
      child: Column(
        children:content,
      ),
    );
  }
}
