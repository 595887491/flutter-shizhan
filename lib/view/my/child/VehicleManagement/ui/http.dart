import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'dart:async';


// 获取车辆管理数据
Future getData() async {
  var response = await HttpUtil().get('/mp/cars');
  print(response['result']);
  List cars=response['result'];
  return cars;
}


Future deleteCar(id) async {
  var response = await HttpUtil().delete("/mp/car/"+id);
  return response;
}