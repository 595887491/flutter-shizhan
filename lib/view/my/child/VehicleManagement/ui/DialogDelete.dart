import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'http.dart';
class DialogDelete extends Dialog{

  String id;
  DialogDelete({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center( //保证控件居中效果
        child: SizedBox(
          width:MediaQuery.of(context).size.width-80.0,
          height: 200.0,
          child:  Container(
            padding: EdgeInsets.only(left: 27.0,right: 27.0),
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(MIcons.err,size: 40.0,color: MTheme.themeColor,),
                Container(
                  padding:EdgeInsets.only(top: 15.0,bottom: 17.0) ,
                  child:Text("你是否确定要删除该车辆信息？确认 删除后将不能找回哦！",textAlign:TextAlign.center,style: TextStyle(
                    fontSize: 15.0,
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        deleteCar(this.id).then((val){
                          if(val['success']){
                            print("删除成功！");
                            Navigator.pop(context);
                          }
                        });
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          color: MTheme.themeColor,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 15.0,bottom: 15.0),
                        child: Text("确 认",style: TextStyle(
                          fontSize: 14.0,
                          color: MTheme.white,
                        ),),
                      ) ,
                    ),
                    Container(
                      width:10.0,
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          color:Color(0xFFB1B0B0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 15.0,bottom: 15.0),
                        child: Text("取 消",style: TextStyle(
                          fontSize: 14.0,
                          color: MTheme.white,
                        ),),
                      ) ,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}