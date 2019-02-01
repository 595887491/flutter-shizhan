import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';

class OrdersList extends StatefulWidget{
  final carNum;
  final stopTime;
  final money;
  final stopArea;
  final orderId;
  final stopDay;
  bool check;
  bool isinvoice;  //是否点击开发票

  bool isallChecked;//是否全选

  List<Map> datas; //请求数据

  OrdersList({
    Key key,
    this.carNum,
    this.stopTime,
    this.money,
    this.stopArea,
    this.orderId,
    this.stopDay,
    this.check,
    this.isinvoice,
    this.isallChecked,
    this.datas  //注入请求数据
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrdersListState();
  }
}

class OrdersListState extends State<OrdersList> {

  Widget checkBox;
  var widths;

//  void checkedItem() {
//    print(widget.datas);
//    for(Map item in widget.datas){
//       if(item['check'] == false) {
//         widget.isallChecked = false;
//       }
//    }
//  }
  @override
  Widget build(BuildContext context) {
    if(widget.isinvoice == true) {
      widths = MediaQuery.of(context).size.width-35;
      checkBox = Container(
            width: 35.0,
            padding: EdgeInsets.only(left: 10.0),
            child: new Checkbox(
              value: widget.check,
              activeColor: Color(0xFF4482FF),
              onChanged: (bool val) {
                // val 是布尔值

                setState(() {
                  widget.check = !widget.check;
//                  checkedItem();
                  for(Map item in widget.datas) {
                    if(item['check'] ==  false){
                       widget.isallChecked = false;
                       print( widget.isallChecked );
                    }
                  }
                });
              },
            ),
          );
    }else{
      widths = MediaQuery.of(context).size.width;
      checkBox = Container();
    }

//    widget.isallChecked == true ? widget.check = true:widget.check = false;
    // TODO: implement build
    return  new Container(
      color: Color(0xFFFFFFFF),
      margin: EdgeInsets.only(top:10.0),
      child:InkWell(
        onTap: () {
          setState(() {
            widget.check = !widget.check;
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            checkBox,
            Container(
              width: widths,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.carNum,style: TextStyle(fontSize: 18.0,color: MTheme.sizeColor,fontWeight: FontWeight.bold),),
                            Text(widget.stopTime,style: TextStyle(fontSize: 13.0,color: Color(0xFF666666)),),
                          ],
                        ),
                        Expanded(
                            child: Container(
                              child: Row(
                                //                      crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(widget.money,style: TextStyle(fontSize: 21.0,color: Color(0xFFFF6D6D),fontWeight: FontWeight.w800)),
                                  Text('元'),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Text(widget.stopArea,
                      style: TextStyle(fontSize: 13.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(  //分割线
//                width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: .5,color: Color(0xFFE5E5E5))
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(13.0,10.0,13.0,10.0),
                    child: Row(
                      children: <Widget>[
                        Text(widget.stopDay,style: TextStyle(fontSize: 12.0,color: Color(0xFF999999),fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
                ],
              ),)
          ],
        ),
      ),
    );
  }

}