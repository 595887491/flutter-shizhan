import 'package:flutter/material.dart';

class MKeyboard extends StatefulWidget{
  _MKeyboard createState() => _MKeyboard();
}

class _MKeyboard extends State<MKeyboard>{



  List<String> _carFirstList = [
    "川","京","津","冀","晋","蒙","辽","吉","黑","沪","苏","浙",
    "皖","闽","赣","鲁","豫","鄂","湘","粤","桂","琼","渝","贵",
    "云","藏","陕","甘","新"
  ];

  int _carIndex = 0;




  @override
  Widget build(BuildContext context) {
    List<Widget> _carShowList = [];


    if(_carIndex==0){
      for(String text in  _carFirstList){
        _carShowList.add(InkWell(
            child: Container(
              decoration: BoxDecoration(
                color:Color(0xFFFFFFFF)
              ),
              padding: EdgeInsets.all(15.0),
              child: Text(text,style: TextStyle(
                fontSize: 20.0,
              ),),
            ),
        ));
      }
    }




    return Container(
      padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 15.0,bottom: 15.0),
      color: Color(0xFFcccccc),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            children: _carShowList,
          )
        ],
      ),
    );;
  }
}
