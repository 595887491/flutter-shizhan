import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

import "../child/setting/Setting.dart";
import '../child/vehiclemanagement/VehicleManagement.dart';
import 'HeaderMsg.dart';
import 'ListMenu.dart';

class Layout extends StatelessWidget {
  final jumppage;

  Layout({Key key, this.jumppage}) : super(key: key);

  List<Widget> geiListMenu(context) {
    List<Widget> listMenus = [];

    List<Map> listData = [
      {
        'icon': MIcons.qianba,
        'title': "我的钱包",
        'click': () {
          this.jumppage(2);
        }
      },
      {
        'icon': MIcons.car,
        'title': "车辆管理",
        'click': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VehicleManagement(),
            ),
          );
        }
      },
      {
        'icon': MIcons.dingdan,
        'title': "我的订单",
        'click': () {
          jumppage(1);
        }
      },
      {
        'icon': MIcons.msgcenter,
        'title': "消息中心",
      },
      {
        'icon': MIcons.setting,
        'title': "设置",
        'click': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Setting(),
            ),
          );
        }
      }
    ];

    for (Map item in listData) {
      listMenus.add(ListMenu(
        title: item['title'],
        icon: item['icon'],
        click: item['click'],
      ));
      listMenus.add(Divider(
        height: 1.0,
        indent: 15.0,
        color: Color.fromRGBO(229, 229, 229, 1),
      ));
    }
    return listMenus;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HeaderMsg(),
        Container(
          color: MTheme.white,
          child: Column(
            children: geiListMenu(context),
          ),
        ),
      ],
    );
  }
}
