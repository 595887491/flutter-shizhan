import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
/// 获取车辆管理数据
Future getData() async {
  var response = await HttpUtil().get('/mp/cars');
  List cars=response['result'];
  return cars;
}

/// 添加车辆车牌
Future addCarId(data) async {
  var response = await HttpUtil().post("/mp/car",data: data);
  print(response);
  return response;
}



/// 车牌照片识别

Future plateLicense(File files) async{
  FormData formData2 =new FormData.from({
    "file":new UploadFileInfo(files, "upload1.jpg"),
  });
  var response = await HttpUtil().post("/mp/plateLicense",data:formData2);
  print(response);
  var data;
  if(response['success']){
    data=response['result'];
  }
  return data;
}