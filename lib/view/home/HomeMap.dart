import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';
import './map/mapIndex.dart'; 
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';//获取定位
// import 'package:amap_location/amap_location.dart';//高德地图定位
// 引入LatLng包用于标记地图中心点
import 'package:latlong/latlong.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class IndexMap extends StatefulWidget{
  @override
  _IndexMap createState() => new _IndexMap();

}
class _IndexMap extends State<IndexMap> {
  // Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  Location _location = new Location();
  bool _permission = false;
  String error;
  bool currentWidget = true;
  Image image1;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    //监听用户位置改变
    _location.onLocationChanged().listen((Map<String,double> result) async {
      print(result);
      setState(() {
        _currentLocation = result;
      });
      // 将当前经纬度加入本地存储
      SharedPreferences userLocation = await SharedPreferences.getInstance();
      userLocation.setDouble('currentLat', result['latitude']);
      userLocation.setDouble('currentLng', result['longitude']);
      // print('存储经度为:$currentLat');
      // print('存储纬度为:$currentLng');
    });//_locationSubscription
  }


  // 向用户请求获取定位.
  initPlatformState() async {
     print("+++++++++++++++++++++++++++++++++++++");
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
       _permission = await _location.hasPermission(); 
      location=await _location.getLocation(); 
    } on PlatformException catch (e) {
    // }  catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // error = 'Permission denied';
        error = '用户拒绝授权地理位置';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        // error = 'Permission denied - please ask the user to enable it from the app settings';
        error = '拒绝授权-请用户开启设置授权App获取当前地理位置！';
      }
    }
     print(error);
     print(_permission);
      setState(() {
      _currentLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(_permission){
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.36,
        // color: Colors.white,
        margin: EdgeInsets.only(left: 15.0,right: 15.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0,color: MTheme.white),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child:_currentLocation == null?null:ListView(
          children: <Widget>[
            Container(
              height: 36.0,
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              color: MTheme.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("附近",style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
                      Text("3个",style: TextStyle(fontSize: 14.0,color: MTheme.themeColor),),
                      Text("停车点",style: TextStyle(fontSize: 14.0,color: MTheme.sizeColor),),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      print("点击‘查看全部’···");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context){
                            return new MapIndex();
                          }
                          // builder: (context) => MapIndex(),
                        )
                      );
                    },
                    child: Text("查看全部",style: TextStyle(fontSize: 14.0,color: MTheme.themeColor),),
                  ),
                ],
              ),
            ),
   Container(//地图部分
              padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height*0.31,
              child: new InkWell(
                onTap: (){
                  print("点击首页地图跳转到全景地图页面");
                },
                child:new FlutterMap(
                  options: new MapOptions(
                    center: new LatLng(_currentLocation['latitude'],_currentLocation['longitude']),
                    zoom: 14,
                  ),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate: "http://www.google.cn/maps/vt?lyrs=m@189&gl=cn&x={x}&y={y}&z={z}",//谷歌地图网址
                      additionalOptions: {
                        'accessToken': 'AIzaSyBjSEOYFHQfE4WN9kzbhJL20BDLKSY051I',//谷歌地图key
                        'id': 'mapbox.streets',//其他附加信息
                      },
                    ),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker( //标记地图
                          width: 20.0,
                          height: 40.0,
                          point: new LatLng(_currentLocation['latitude'],_currentLocation['longitude']),
                          builder: (ctx)=>
                            new Container(
                              child: new Image.network("https://i.loli.net/2018/11/23/5bf774f1e6ec5.png"),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

    // }else{
    //   return Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height*0.36,
    //     // color: Colors.white,
    //     margin: EdgeInsets.only(left: 15.0,right: 15.0),
    //     decoration: BoxDecoration(
    //       border: Border.all(width: 2.0,color: MTheme.white),
    //       borderRadius: BorderRadius.all(Radius.circular(6.0)),
    //     ),
    //     // child:SpinKitFadingCircle(color: Color.fromRGBO(0, 0, 0, .5), size: 50.0,)
    //     child:Center(
    //       child: Text("你尚未授权位置信息，暂无法获取地图信息！"),
    //     )
    //   ); 
    // }
  }

  // Widget locationMain(){
  //   return 
  // }

}
