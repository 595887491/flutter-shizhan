import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';

class RuleIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: MAppBar(
          title: Text(
            '积分规则',
            style: TextStyle(
              fontSize: 18,
            ),),
          isgoback:true,
        ).build(context),
        body: Container(
          child: ListView(
            children: <Widget>[page()],
          ),
        ));
  }
 //内容
  Widget page() {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  '积分规则',
                  style: TextStyle(
                      fontSize: 28.0,
                      color: Color(0xFF333333),
                      textBaseline: TextBaseline.ideographic),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  '什么是积分？',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF333333),
                      textBaseline: TextBaseline.ideographic),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 12.0),
            child: Text(
              '积分是停车用户通过支付停车费用、充值余额等行为获得的累计积分值，积分可在积分商城兑换礼品或者抵扣停车费用。',
              style: TextStyle(fontSize: 18.0, color: Color(0xFF333333)),
            ),
          ),
          Divider(
            height: 2.0,
            color: Color(0xFFE5E5E5),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  '积分如何获得？',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF333333),
                      textBaseline: TextBaseline.ideographic),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              '获得积分的方式如下，规则会根据实际情况动态调整，最终解释权归智慧停车所有。',
              style: TextStyle(fontSize: 18.0, color: Color(0xFF333333)),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top:10.0,bottom: 20.0),
            child: Table(
                border: new TableBorder.all(width: 1.0, color:Color(0xFFE5E5E5)),
                children: <TableRow>[
                  new TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7)
                    ),
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('用户行为',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('积分制',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('用户行为',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('10积分',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7)
                    ),
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:25.0,bottom: 10.0),
                              child: new Text('每日签到',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('1天得1积分，连续2天得2积分，连续7天得4积分',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('绑定车牌号',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('10积分',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7)
                    ),
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('为应用评分',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('15积分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:35.0,bottom: 10.0),
                              child: new Text('分享实时车位',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child:Column(
                                children: <Widget>[
                                  new Text('首次3积分，第二次4积分，之后5分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                                  Text('同一停车场第二次开始均得1积分',style: TextStyle(fontSize: 14.0,color: Color(0xFFFA6B11)),textAlign: TextAlign.center,)
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7)
                    ),
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('停车场信息纠错',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('8积分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),


                  new TableRow(
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('支付停车费',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('5积分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7)
                    ),
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('钱包支付',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('2积分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),

                  new TableRow(
                    children: <Widget>[
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                              child: new Text('奇思妙想',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),),
                            )
                        ),
                      ),
                      new TableCell(
                        child: new Center(
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new Text('1积分/次',style: TextStyle(fontSize: 14.0,color: Color(0xFF585858)),textAlign: TextAlign.center,),
                            )
                        ),
                      ),
                    ],
                  ),
                ]),
           ),

          Divider(
            height: 2.0,
            color: Color(0xFFE5E5E5),
          ),

          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  '积分如何获得？',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF333333),
                      textBaseline: TextBaseline.ideographic),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              '您在当前年度获得的积分，会在下一年年底过期。 （如：您在2016年1月1日-2016年12月31日期间获得的积分将于2017年12月31日过期）',
              style: TextStyle(fontSize: 18.0, color: Color(0xFF333333)),
            ),
          ),

          InkWell(
            onTap:() {

            } ,
            child: Padding(
                padding: EdgeInsets.only(top:10.0,bottom: 30.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '查看积分明细',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFF4482FF),decoration: TextDecoration.underline),
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
