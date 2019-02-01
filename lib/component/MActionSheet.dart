import 'package:flutter/material.dart';



class MActionSheet extends StatelessWidget {

  final clickCamera;
  final clickphoto;

  MActionSheet({Key key,this.clickCamera,this.clickphoto}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text("拍照"),
            onTap: () async {
              clickCamera();
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:  Text("从相册中选择"),
            onTap: () async {
              clickphoto();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}