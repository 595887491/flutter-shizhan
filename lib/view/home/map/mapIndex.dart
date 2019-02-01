import 'package:flutter/material.dart';
import "package:kaka_flutter_mp/component/MAppBar.dart";
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MapIndex extends StatefulWidget{
  // Map currentLocation; 
  // MapIndex({Key key,@required this.currentLocation}): super(key : key);
  @override
  State<StatefulWidget> createState() => new _MapIndex();
}
class _MapIndex extends State<MapIndex>{
    bool lotsListVisible = false;
    bool viewMoreVisible = true;
    Container parklots;
    double userLat;
    double userLng;
    // 获取用户经纬度
    Future readLatLng() async {
      SharedPreferences userLocation = await SharedPreferences.getInstance();
      setState(() {
        userLat = userLocation.get('currentLat');
        userLng = userLocation.get('currentLng');
      });
      print('读取到的经度为:$userLat');
      print('读取到的纬度为:$userLng');

    }
    @override
    void initState(){
      readLatLng();
    }
    @override
    Widget build(BuildContext context) {
      if(lotsListVisible){
        setState(() {
          lotsListVisible = true;
          viewMoreVisible = false;
        });
        parklots = Container(
          child: Center(
            child: Text("停车点列表"),
          ),
        );
      }else{
        setState(() {
          lotsListVisible = false;
          viewMoreVisible = true;
        });
        parklots = Container(
          height: 40.0,
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child: Center(
            child: 
            InkWell(
              onTap: (){
                print("点击了‘查看更多’按钮");
                print(lotsListVisible);
                setState(() {
                  lotsListVisible = true;
                  viewMoreVisible = false;
                });
                print(lotsListVisible);
              },
              child: Text(
                  "点击查看附近更多停车点",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff4482ff),
                    
                  ),
                ),
            ),
          ),
          // ),
        );

      }
      if(userLat != null && userLng != null){
        return Scaffold(
          appBar: AppBar(
            title:Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8.0),
                  icon: Icon(Icons.search),
                  labelText: "输入停车点名称/关键字"
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.82,
                child:new FlutterMap(
                  options:new MapOptions(
                    center: new LatLng(userLat,userLng),
                      zoom: 15,
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
                          point: new LatLng(userLat,userLng),
                          builder: (ctx)=>
                            new Container(
                              child: new Image.network("https://i.loli.net/2018/11/23/5bf7754334c52.png"),
                            ),
                        )
                        // new Marker( //标记地图
                        //   width: 30.0,
                        //   height: 42.0,
                        //   point: new LatLng(userLat,userLng),
                        //   builder: (ctx)=>
                        //     new Container(
                        //       child: new Image.network("https://i.loli.net/2018/11/23/5bf7754334c52.png"),
                        //     ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              parklots,
            ],
          ),  
        );
      }else{
        return Scaffold(
          appBar: AppBar(
            title:Container(
              height: 60.0,
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8.0),
                  icon: Icon(Icons.search),
                  labelText: "输入停车点名称/关键字"
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          body: Container(
            child:SpinKitFadingCircle(color: Color.fromRGBO(0, 0, 0, .5), size: 50.0,)//加载动画
          )
                    
        );
        
      }
    }
}