import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import 'package:kaka_flutter_mp/model/UsersCar.dart';

import 'http.dart';
import 'Car.dart';
import '../child/addthecar/AddTheCar.dart';

class Layout extends StatefulWidget {
  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<Layout> {
  List cardata;

  @override
  void initState() {
    super.initState();
    getData().then((onValue) {
      setState(() {
        this.cardata = onValue.map((json) => UsersCar.fromJson(json)).toList();
        print(this.cardata);
      });
    });
  }

  List<Widget> getshowview() {
    List<Widget> getCarList = [];
    for (int i = 0; i < cardata.length; i++) {
      var item = cardata[i].toJson();
      getCarList.add(
        Car(
          carId: item['carId'],
          // plateNumber: item["plateNumber"],
          authentication: item['carOwner'],
        ),
      );
    }
    getCarList.add(InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (content) => AddTheCar(type: 0),
          ),
        );
      },
      child: Container(
        margin:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 50.0),
        // 卡片效果
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(-2.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(0, 28.0, 0, 25.0),
        child: Column(
          children: <Widget>[
            Icon(
              MIcons.add,
              color: MTheme.themeColor,
              size: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                "添加车辆",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: MTheme.sizeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
    return getCarList;
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      color: Color(0xFFEEEEE),
      child: cardata == null
          ? Container(
              color: Color.fromRGBO(0, 0, 0, 0.8),
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            )
          : ListView(
              children: getshowview(),
            ),
    );
  }
}
