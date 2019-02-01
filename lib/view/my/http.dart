import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'package:kaka_flutter_mp/db/UsersCarDB.dart';
import 'package:kaka_flutter_mp/model/UsersCar.dart';
import 'dart:async';
import 'dart:convert';
// 获取车辆管理数据
Future getData() async {
  var response = await HttpUtil().get('/mp/cars');
  UsersCarDB db=new UsersCarDB();

  print("*********************");
  print(response['result']);
  List<UsersCar> cars = [];
  for(Map item in response['result']){
    cars.add(UsersCar(item['carId'],item['plateNumber'] , item['carType'],item['carOwner']));
  }
  print(cars);
  String json = jsonEncode(cars);
  print(json);
  print("++++++++++++++++++++++++");
  db.insert("000000", json);
}


// 获取车辆管理数据
Future<List<dynamic>> getCarData() async {
  UsersCarDB db=new UsersCarDB();
  print("********从本地拿去车辆数据*************");
  List datalist=[];
  db.getUsersCar("000000").then((val){
    for(UsersCar item in val){
      datalist.add(item.toJson());
    }
  });

  return datalist;
}
