import 'package:flutter/material.dart';
import '../record/RecordIndex.dart';
import '../child/Selectmoney.dart';
import '../Paymoney.dart';

class Page extends StatefulWidget{
  @override
  _Page createState()=>new _Page();
}

class _Page extends State<Page>{

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();  //
  var paymoney; //充值金额

  RegExp frxg = RegExp('^[0-9]*');//验证是否输入数字

  void _onSubmit() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      if(paymoney  == '') {
        showDialog(context: context, builder: (ctx)=> new AlertDialog(
          title: Text('错误'),
          content:  new Text('请输入数字'),
          actions: <Widget>[
            FlatButton(
              child: Text('确定',style: TextStyle(color: Color(0xFF4482FF))),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ));
      }
    }
  }
  //其它金额弹窗
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title:new Form(
                key: _formKey,
                child:Column(
                children: <Widget>[
                  Text('请输入充值金额：'),
                  Container(
                      margin: EdgeInsets.only(top:10.0),
                      alignment: Alignment.center,
//                    height: 35.0, // 定高
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0), // 圆角
                        border: Border.all(
                          color: Color.fromRGBO(229, 229, 229, 1),
                          width: 1.0,
                        ), // border边框
                      ),
                      child:new TextFormField(
                        style: TextStyle(
                          // 文本样式
                          fontSize: 14.0,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                        onSaved: (val){
                          paymoney = frxg.stringMatch(val);
                        },
                        validator: (val)=> (val == null || val.isEmpty ) ? "请输入充值金额": null,
                        keyboardType: TextInputType.number, // 键盘类型
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(14.0),
                          hintText: "请输入充值金额",
                          hintStyle: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                          border: InputBorder.none, //不要边框，使用container的边框
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
//                      width: 100.0,
                        margin: EdgeInsets.only(right: 20.0,top:25.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFB1B0B0),
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child:FlatButton(
                          child: Text('取消',style: TextStyle(color: Color(0xFFFFFFFF))),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ),
                      Container(
//                      width: 100.0,
                        margin: EdgeInsets.only(top:25.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF4482FF),
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child:FlatButton(
                          child: Text('确定',style: TextStyle(color: Color(0xFFFFFFFF)),),
                          onPressed:_onSubmit,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ));
  }

  List<Widget> payLists = [];
  List<Widget> selectList(context) {
    payLists=[];
    for(Map item in Paymoney.payDatas) {
      payLists.add(Selectmoney(
        paymoney:item['paymoney'],
        tomeney:item['tomeney'],
        isClick:item['isClick'],
        datas:Paymoney.payDatas
      ));
    }
    return payLists;
  }

  @override
  Widget build(BuildContext context) {
   return new Container(
      color: Color(0xFFFFFFFF),
      child: new ListView(
        children: <Widget>[
          myMoney(context),
          money(),
        ],
      ),
    );
  }
 //.头部余额
  Widget myMoney(context){
    final _fontSizes = TextStyle(fontSize:13.0,color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold);
    return  Container(
//      color:Color(0xFF4482FF),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4482FF),Color(0xFF51CBFE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.only(top:20.0,bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                  Text('账户余额',style: _fontSizes,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(top:5.0),
                        child:Text('￥',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),),),
                      Text('30',style: TextStyle(fontSize: 34.0,fontWeight: FontWeight.w800,color: Color(0xFFFFFFFF)),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top:25.0),
                    child:Text('多充多惠',style: TextStyle(fontSize: 11.0,color: Color(0xFFFFFFFF)),),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //充值金额
  Widget money() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        children: <Widget>[
           Container(
             margin: EdgeInsets.only(top:8.0),
             child:Row(
               children: <Widget>[
                 Text('充值',style: TextStyle(fontSize: 18.0),textAlign: TextAlign.left,),
               ],
             ),
           ),
            Column(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.only(top:10.0),
                   child:Wrap(
                     spacing: 15.0,
                     alignment: WrapAlignment.start,
                     runSpacing: 15.0,
                     children:selectList(context),
                   ),
                 ),

                 Container(
                   padding: EdgeInsets.only(top:15.0),
                   child:Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[

                     ],
                   ),
                 ),

                 InkWell(  //其它金额
                   onTap:_onBackPressed,
                   child:Center(
                     child:Padding(
                         padding: EdgeInsets.only(top:40.0,bottom: 15.0),
                         child: Text('其他金额',style: TextStyle(fontSize: 13.0,color: Color(0xFF999999),fontWeight: FontWeight.w500),),
                     )
                   ),
                 ),
                 InkWell(  //查看充值记录
                   onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                       return RecordIndex();
                     }));
                   },
                   child:Center(

                     child: Container(
//                       margin: EdgeInsets.only(bottom: 100.0),
                       child: Text('查看充值记录',style: TextStyle(fontSize: 15.0,color: Color(0xFF4482FF),fontWeight: FontWeight.w500,decoration: TextDecoration.underline),),
                     ),
                   ),
                 )
               ],
            )
        ],
      ),
    );
  }
}


