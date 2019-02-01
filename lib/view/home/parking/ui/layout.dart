import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

class Layout extends StatefulWidget{
  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout>{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container( //上部分
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.52,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF52D0FE), MTheme.themeColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child:Column(
              children: <Widget>[
                Container( //上部表盘
                  padding: EdgeInsets.only(top:44.0),
                  child: Container(
                    width: 234.0,
                    height: 234.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://i.loli.net/2018/12/18/5c1880ae396f0.png"),
                        // centerSlice: Rect.fromLTWH(30.0, 50.0, 200.0, 200.0)
                        fit: BoxFit.fill
                      )
                    ),
                    child: Container(
                      // margin: EdgeInsets.only(top: 80.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "川A13213",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff4482ff)
                            ),
                          ),
                          Text(
                            "00:06:36",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff4482ff)
                            ),
                          ),
                          Text(
                            "H      M      S",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff999999)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded( //波浪线图片
                  child:Image(
                    image:AssetImage("assets/images/parkingbg.png"),
                    fit:BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
          Container(//中间部分
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "车位号",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff666666)
                      ),
                    ),
                    Text(
                      "2000002",
                      style:TextStyle(
                        fontSize: 24.0,
                        color: Color(0xff333333)
                      )
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "收费标准",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff666666)
                      ),
                    ),
                    Text(
                      "3元/h",
                      style:TextStyle(
                        fontSize: 24.0,
                        color: Color(0xff333333)
                      )
                    )
                  ],
                )
              ],
            ),
          ),
          Container(//底部说明
            margin: EdgeInsets.only(top:40.0),
            padding: EdgeInsets.only(left: 30.0,right: 30.0),
            child: Text(
              "本停车场内停车费为每小时15元，单次停车满3小时优惠5元，上不封顶。",
              style: TextStyle(
                fontSize: 12.0,
                color:Color(0xff999999)
              ),
              textAlign: TextAlign.center,
            ),

          )
        ],
      ),
    );
    
    
  }
}