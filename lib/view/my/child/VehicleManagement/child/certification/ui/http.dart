import 'dart:io';

import 'package:kaka_flutter_mp/http/httpUtil.dart'; 
import 'dart:async'; 
import 'package:dio/dio.dart';
// 车辆行驶证识别
Future photoIdentify(String id,File file) async {
  FormData formdata =  FormData.from({
    "file": UploadFileInfo(file, "photo.jpg"),
  });
  return await HttpUtil().post("/mp/bindCarLicense/"+id,data: formdata);
}
 


// 获取车辆管理数据
Future<List<dynamic>> getCarData() async {

}
