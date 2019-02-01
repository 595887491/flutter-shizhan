import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';
import '../../../style/MTheme.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';

class InvoiceIndex extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InvoiceState();
  }
}

class InvoiceState extends State<InvoiceIndex>{
   bool isChecked = true;
   int rvalue = 1;
   void method1(value) {  //选择个人发票还是公司发票
     setState(() {
       rvalue = value;
     });
     print(value);
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: MAppBar(
        title: Text('开具发票'),
        isgoback: true,
      ).build(context),
      body:new Container(
         color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            types(),
            message(),
            emails(),
            sureBottom()
          ],
        ),
      )
    );
  }

 //发票类型交互
  Widget invoiceType() {
     Stack bot;
     if(isChecked == true) {
       bot =  Stack(
         alignment: Alignment(1.0,0.9),
         children: <Widget>[
           Container(
             padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
             decoration: BoxDecoration(
                 border: Border.all(width: 1.0,color: Color(0xFF4482FF)),
                 borderRadius: BorderRadius.circular(3.0)
             ),
             child: Text('电子发票',style: TextStyle(fontSize: 14.0,color: Color(0xFF4482FF),fontWeight: FontWeight.w500),),
           ),
           Container(
             child:Icon(MIcons.xuanzhong,size: 20.0,color: Color(0xFF4482FF),) ,
           )
         ],
       );
    }else{
      bot = Stack(
      alignment: Alignment(1.0, 0.9),
      children: <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xFF999999)),
          borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text('电子发票', style: TextStyle(fontSize: 14.0, color: Color(0xFF999999), fontWeight: FontWeight.w500), ),
          ),
      ],
    );
    }
     return Container(
        margin: EdgeInsets.only(top:10.0,bottom: 8.0),
        child: InkWell(
          onTap: () {
            setState((){
                this.isChecked = !this.isChecked;
            });
          },
          child:bot,
        ),
      );
  }
  //发票类型
  Widget types() {
    return Container(
           padding: EdgeInsets.all(12.0),
           margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
           color: MTheme.white,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('发票类型',style: TextStyle(fontSize: 17.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
              invoiceType(),
              Container(
                child: Text('电子发票与纸质发票具有同等法律效力，可支持报销入账。',style: TextStyle(fontSize: 12.0,color: Color(0xFF666666)),),
              )
            ],
          ),
       );
  }

  //发票信息
  Widget message() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      color: MTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
             Expanded(
               child:  Container(
                 padding: EdgeInsets.all(12.0),
                 decoration: BoxDecoration(
                     border: Border(
                       top: BorderSide(width: 0, color: Color(0x66ffffff)),
                       left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                     )
                 ),
                 child: Text('发票信息',style: TextStyle(fontSize: 17.0,color: MTheme.sizeColor,fontWeight: FontWeight.bold),),
               ),
             )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 12.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0,3.0,0.0,3.0),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 0, color: Color(0x66ffffff)),
                        left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                      )
                  ),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment(2.8, 0.0),
                          children: <Widget>[
                            new Radio (
                                value: 1,
                                activeColor: Color(0xFF4482FF),
                                groupValue: rvalue,
                                onChanged: (int rval){method1(rval);
                                }),
                            Container(
                              child: Text('个人'),
                            ),
                          ],
                        ),
                       Padding(
                         padding: EdgeInsets.only(left: 20.0),
                         child:   Stack(
                           alignment: Alignment(2.8, 0.0),
                           children: <Widget>[
                             new Radio (
                                 value: 2,
                                 activeColor: Color(0xFF4482FF),
                                 groupValue: rvalue,
                                 onChanged: (int rval){method1(rval);
                             }),
                             Container(
                               child: Text('公司'),
                             ),
                           ],
                         ) ,
                       ),
                      ],
                  ),
                ),

               Container(
                   padding: EdgeInsets.fromLTRB(0.0,15.0,0.0,15.0),
                   decoration: BoxDecoration(
                       border: Border(
                         top: BorderSide(width: 0, color: Color(0x66ffffff)),
                         left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                         right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                         bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                       )
                   ),
                 child:  Row(
                   children: <Widget>[
                     Container(
                       width: 90.0,
                       child: Text('发票信息',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                     ),
                     Expanded(
                         child:Text('个人（不可修改）',
                           style: TextStyle(fontSize: 15.0,color:Color(0xFF999999),fontWeight: FontWeight.w500),
                         )
                     ),
                   ],
                 ),
               ),

                rvalue ==1 ? Container(
                 padding: EdgeInsets.fromLTRB(0.0,4.0,0.0,4.0),
                 decoration: BoxDecoration(
                     border: Border(
                       top: BorderSide(width: 0, color: Color(0x66ffffff)),
                       left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                     )
                 ),
                 child:  Row(
                   children: <Widget>[
                     Container(
                       width: 90.0,
                       child: Text('手机号',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                     ),
                     Expanded(
                         child:TextField(
                           autocorrect: false, //禁止输入
                           autofocus: false,
                           decoration: InputDecoration(
                             hintText: '请输入常用手机号',
                             border: InputBorder.none,
                             hintStyle: TextStyle(fontSize: 15.0,color:Color(0xFFCCCCCC),fontWeight: FontWeight.w500),
                           ),
                           style: TextStyle(fontSize: 15.0,color:Color(0xFF999999),fontWeight: FontWeight.w500),
                         )
                     ),
                   ],
                 ),
               ):Container(
                  padding: EdgeInsets.fromLTRB(0.0,4.0,0.0,4.0),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 0, color: Color(0x66ffffff)),
                        left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                        bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                      )
                  ),
                  child:  Row(
                    children: <Widget>[
                      Container(
                        width: 90.0,
                        child: Text('识别号',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                      ),
                      Expanded(
                          child:TextField(
                            autocorrect: false, //禁止输入
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: '纳税人识别号或统一社会信用代码',
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 15.0,color:Color(0xFFCCCCCC),fontWeight: FontWeight.w500),
                            ),
                            style: TextStyle(fontSize: 15.0,color:Color(0xFF999999),fontWeight: FontWeight.w500),
                          )
                      ),
                    ],
                  ),
                ),

               Container(
                 padding: EdgeInsets.fromLTRB(0.0,15.0,0.0,15.0),
                 decoration: BoxDecoration(
                     border: Border(
                       top: BorderSide(width: 0, color: Color(0x66ffffff)),
                       left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                       bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                     )
                 ),
                 child:  Row(
                   children: <Widget>[
                     Container(
                       width: 90.0,
                       child: Text('发票内容',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                     ),
                     Expanded(
                         child:Text('停车收费',
                           style: TextStyle(fontSize: 15.0,color:Color(0xFF999999),fontWeight: FontWeight.w500),
                         )
                     ),
                   ],
                 ),
               ),

               Container(
                 padding: EdgeInsets.fromLTRB(0.0,15.0,0.0,15.0),
                 child:  Row(
                   children: <Widget>[
                     Container(
                       width: 90.0,
                       child: Text('发票金额',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                     ),
                     Row(
                       children: <Widget>[
                         Text('35',
                           style: TextStyle(fontSize: 21.0,color:Color(0xFFFF5F6A),fontWeight: FontWeight.bold),
                         ),
                         Text('元',
                           style: TextStyle(fontSize: 13.0,color:MTheme.sizeColor)),
                       ],
                     ),
                   ],
                 ),
               )
              ],
            ),
          )
        ],
      ),
    );
  }

  //接受方式
   Widget emails() {
     return Container(
       color: MTheme.white,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Row(
             children: <Widget>[
               Expanded(
                 child:  Container(
                   padding: EdgeInsets.all(12.0),
                   decoration: BoxDecoration(
                       border: Border(
                         top: BorderSide(width: 0, color: Color(0x66ffffff)),
                         left: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                         right: BorderSide(width: 0.0, color: Color(0x66ffffff)),
                         bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
                       )
                   ),
                   child: Text('接收方式',style: TextStyle(fontSize: 17.0,color: MTheme.sizeColor,fontWeight: FontWeight.bold),),
                 ),
               )
             ],
           ),
           Container(
             margin: EdgeInsets.only(left: 12.0),
             child: Column(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.fromLTRB(0.0,4.0,0.0,4.0),
                   child:  Row(
                     children: <Widget>[
                       Container(
                         width: 90.0,
                         child: Text('邮箱号码',style: TextStyle(fontSize: 15.0,color: MTheme.sizeColor,fontWeight: FontWeight.w500),),
                       ),
                       Expanded(
                           child:TextField(
                             autocorrect: false, //禁止输入
                             autofocus: false,
                             decoration: InputDecoration(
                               hintText: '用于向您发送电子发票',
                               border: InputBorder.none,
                               hintStyle: TextStyle(fontSize: 15.0,color:Color(0xFFCCCCCC),fontWeight: FontWeight.w500),
                             ),
                             style: TextStyle(fontSize: 15.0,color:Color(0xFF999999),fontWeight: FontWeight.w500),
                           )
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           )
         ],
       ),
     );
   }

   //确定按钮
   Widget sureBottom() {
     return Container(
       margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: MButton(
                      button:Container(
                        padding: EdgeInsets.fromLTRB(30.0,12.0,30.0,12.0),
                        child: Text('确定',
                          style: TextStyle(fontSize: 18.0,color: MTheme.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                      )
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:30.0),
              child: Text('· 支付中各种形式的优惠金额不支持开具发票；',style: TextStyle(fontSize: 13.0,color: Color(0xFF999999)),),
            ),
            Container(
               margin: EdgeInsets.only(top:7.0),
               child: Text('· 电子发票一旦开具后不能补开',style: TextStyle(fontSize: 13.0,color: Color(0xFF999999))),
             )
          ],
        ),
     );
   }
}
