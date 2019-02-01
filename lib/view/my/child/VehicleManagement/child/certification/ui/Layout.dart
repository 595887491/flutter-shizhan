import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaka_flutter_mp/component/MActionSheet.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

import '../../achieve/Achieve.dart';
import 'Package:kaka_flutter_mp/component/MButton.dart';
import 'http.dart';
class Layout extends StatefulWidget{
  final String id;

  Layout({Key key,this.id}):super(key:key);

  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout> {
  File _image;


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getPhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      color: MTheme.themeBGColor,
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 11.0),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text("上传您的行驶证照片即可完成认证",style: TextStyle(
                fontSize: 13.0,
                color: Color(0xFF999999)
            ),),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child:
                _image == null?
                Container(
                  // 卡片效果
                    decoration: BoxDecoration(
                      color: MTheme.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: const Color(0xFFeeeeee),
                          offset: new Offset(-2.0, 1.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    height: 248.0,
                    margin: EdgeInsets.only(top: 13.0,bottom: 80.0),
                    alignment: Alignment.center,
                    child:Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context){
                                  // 这里还没找到解决方案
                                  return  MActionSheet(
                                    clickCamera: getImage,
                                    clickphoto: getPhoto,
                                  );
                                }
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFEEEEEE),
                            ),
                            width:160.0,
                            height: 113.0,
                            margin: EdgeInsets.only(top: 54.0,bottom: 15.0),
                          ),
                        ),
                        Text(
                          "行驶证主页照片",style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14.0,
                        ),
                        ),
                      ],
                    )
                ):InkWell(
                  onTap: (){
                    getImage();
                  },
                  child: Container(
                    // 卡片效果
                    margin: EdgeInsets.only(top: 13.0,bottom: 80.0),
                    decoration: BoxDecoration(
                      color: MTheme.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: const Color(0xFFeeeeee),
                          offset: new Offset(-2.0, 1.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    height: 248.0,
                    padding: EdgeInsets.all(15.0),
                    child: RotatedBox(quarterTurns: 1,child: Image.file(_image,fit: BoxFit.fill,)),
                  ),
                ),
              ),
            ],
          ),
          MButton(
            click: (){
              photoIdentify(widget.id, _image).then((val){
                print(val);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Achieve(
                      title:val['msg'],
                      status: val["success"],
                    ),
                  ),
                );
              });
            },
            button: Container(
              padding: EdgeInsets.all(13.0),
              alignment: Alignment.center,
              child: Text(
                "确认上传",style: TextStyle(
                color: MTheme.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
