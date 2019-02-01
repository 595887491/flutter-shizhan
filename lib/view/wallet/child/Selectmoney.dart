import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/http/httpUtil.dart';

class Selectmoney extends StatefulWidget{
  final paymoney;
  final tomeney;
  bool isClick;
  final datas;
  Selectmoney({Key key,this.paymoney,this.tomeney,this.isClick,this.datas});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectmoneyState();
  }
}

class SelectmoneyState extends State<Selectmoney>{
  Color background;
  Color fsColor;

  Future toUp(rechargeMoney) async {
    var response = await HttpUtil().post('/mp/swift-top-up',
        data: {'rechargeMoney':rechargeMoney,'ruleId':0});

    if(response['success']) {
      print('充值成功');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    !widget.isClick ? background = Color(0xFFFFFFFF) : background = Color(0xFF4482FF);
    widget.isClick ? fsColor = Color(0xFFFFFFFF) : fsColor = Color(0xFF4482FF);
    return InkWell(
      onTap: () {
        setState(() {
          for(Map item in widget.datas){
            print(item);
            item['isClick'] = false;
          }
          widget.isClick = !widget.isClick;
        });
        toUp(widget.tomeney); //充值请求
      },
      child: Container(
        width:MediaQuery.of(context).size.width/3.6,
        padding: EdgeInsets.only(top:15.0,bottom: 15.0),
        decoration: BoxDecoration(
            color:background,
            border: Border.all(
                width: 1.0,color: Color(0xFF4482FF)
            ),
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(widget.paymoney,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: fsColor),),
                ),
                Text('元',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color:fsColor),)
              ],
            ),
            Text('(到账${widget.tomeney}元)',style: TextStyle(fontSize: 11.0,color: fsColor),)
          ],
        ),

      ),
    );
  }
}