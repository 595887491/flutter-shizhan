import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaka_flutter_mp/component/MActionSheet.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/view/login/Login.dart';

import 'ListMenu.dart';

class Layout extends StatefulWidget {
  @override
  _Layout createState() => _Layout();
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
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListMenu(
          title: Text(
            "妮儿~bbp",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: MTheme.sizeColor),
          ),
          content: Container(
            child: ClipOval(
              child: Container(
                color: MTheme.themeBGColor,
                width: 58.0,
                height: 58.0,
                child: new Image.asset(
                  "assets/images/header.jpg",
                ),
              ),
            ),
          ),
          click: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  // 这里还没找到解决方案
                  return MActionSheet(
                    clickCamera: getImage,
                    clickphoto: getPhoto,
                  );
                });
          },
        ),
        ListMenu(
          title: Text(
            "联系方式",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: MTheme.sizeColor),
          ),
          content: Container(
            child: Text(
              "13545698962",
              style: TextStyle(fontSize: 16.0, color: Color(0xff666666)),
            ),
          ),
          click: () {},
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 200.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xff4482ff)),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Text(
                  "退出登录",
                  style: TextStyle(
                    color: MTheme.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
