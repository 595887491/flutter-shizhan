import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'Address.dart';
import 'PackingNumber.dart';
import 'CarId.dart';
import 'http.dart';
import '../../../VehicleManagement.dart';
class Layout extends StatefulWidget {
  final int type;
  // 主页面传过来的参数 默认为0
  Layout({Key key,this.type=0}):super(key:key);

  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout> {
  File imageFile;
  String plateNumber;
  int plateNumberType=0;

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    plateLicense(image).then((onValue){
      if(onValue!=null && onValue["words_result"]!=null){
        setState(() {
           plateNumber=onValue["words_result"]["number"];
        });
      }else{
        print("识别失败，请重新拍照或者手动输入");
      }
    });
  }



  List<Widget> showView() {
    List<Widget> listdata = [];
    if (widget.type == 0) {
      listdata.add(CarId(
        callback: (val,type) {
          setState(() {
            this.plateNumber = val;
            this.plateNumberType=type;
          });
        },
        plateNumber: this.plateNumber,
        carType: this.plateNumberType,
      ));
      listdata.add(
        Divider(
          height: 1.0,
          color: Color.fromRGBO(229, 229, 229, 1),
        ),
      );
    } else {
      listdata.add(Address("南外区/交警二大队停车点"));
      listdata.add(Divider(
        height: 1.0,
        color: Color.fromRGBO(229, 229, 229, 1),
      ));
      listdata.add(PackingNumber());
      listdata.add(Divider(
        height: 1.0,
        color: Color.fromRGBO(229, 229, 229, 1),
      ));
    }

    listdata.add(Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: MButton(
              click: () {
                getImage();
              },
              button: Container(
                padding: EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MIcons.camera,
                      color: Color(0xffffffff),
                      size: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "快速拍照识别",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));

    listdata.add(Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: MButton(
              click: () {
                Map data = {
                  "plateNumber": this.plateNumber,
                  "carType": this.plateNumberType,
                };
                addCarId(data).then((val){
                  print(val);
                  if(val["success"]){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (content) => VehicleManagement(),
                      ),
                    );
                  }
                });
              },
              button: Container(
                padding: EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Text(
                  "确认",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));

    return listdata;
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      child: ListView(
        // 禁止滚动
        physics: NeverScrollableScrollPhysics(),
        children: showView(),
      ),
    );
  }
}
