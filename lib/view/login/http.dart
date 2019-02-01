import 'package:kaka_flutter_mp/http/httpUtil.dart';

// 登录获取返回信息
Future getData() async {
  var response = await HttpUtil().post('/admin/system/login',
      data: {'username': "superadmin", 'password': '000000'});
  print("$response");
  // setState(() {});
}
