/*
 * 网络请求封装
 */

import 'package:dio/dio.dart';
import 'config.dart';
class HttpUtil {
  static HttpUtil instance;
  static String token="eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiLlkpTlkpTmmbrmhaflgZzovaYiLCJleHAiOjMyNDcyMTE1MjAwLCJ1c2VySWQiOjEwNDczMjUyMTE5ODYzMjk2MDJ9.vajPeYhstMXQmmOJV5jxS6wKhEg410A8Q6I-e8S58Xs";
  static Config _config =Config();
  static Dio _dio;
  Options _options;

  static HttpUtil getInstance() {
    print('获取实例 如果没有就创建一个');
    if (instance == null) {
      instance = new HttpUtil();
    }
    return instance;
  }



  HttpUtil() {
    print('dio赋值');
    // 或者通过传递一个 `options`来创建dio实例
    _options = Options(
      // 请求基地址
      baseUrl: "http://47.105.54.204:8888",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: _config.connectTimeout,
      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: _config.receiveTimeout,
      headers: {},
    );
    _dio = new Dio(_options);

    /// 发送请求拦截处理，如添加token
    _dio.interceptor.request.onSend = (Options options) async{
      print(options.baseUrl);

      options.headers["Mp-Token"] = token;
      return options;
    };

    /// 请求成功拦截
    _dio.interceptor.response.onSuccess = (Response response) async{
      print(response.statusCode);
      return response;
    };
    /// 请求失败拦截
    _dio.interceptor.response.onError = (DioError e){
      print(e);
      return e;
    };
  }

  // get 封装
  get(url,{ options, cancelToken, data}) async {
    print('get:::url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.get(url);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }else{
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }

  // post请求封装
  post(url,{ options, cancelToken,data}) async {
    print('post请求::: url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.post(
          url,
          data:data !=null ? data : {},
          cancelToken:cancelToken
      );
      print(response);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('post请求取消! ' + e.message);
      }else{
        print('post请求发生错误：$e');
      }
    }
    return response.data;
  }

  // put请求封装
  put(url,{ options, cancelToken,data}) async {
    print('put请求::: url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.put(
          url,
          data:data !=null ? data : {},
          cancelToken:cancelToken
      );
      print(response);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('put请求取消! ' + e.message);
      }else{
        print('put请求发生错误：$e');
      }
    }
    return response.data;
  }

  // delete请求封装
  delete(url,{ options, cancelToken,data}) async {
    print('delete请求::: url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.delete(
          url,
          data:data !=null ? data : {},
          cancelToken:cancelToken
      );
      print(response);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('delete请求取消! ' + e.message);
      }else{
        print('delete请求发生错误：$e');
      }
    }
    return response.data;
  }
}
