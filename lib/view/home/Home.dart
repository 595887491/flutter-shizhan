import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kaka_flutter_mp/style/icon.dart';
import 'package:kaka_flutter_mp/component/MButton.dart';
import 'package:kaka_flutter_mp/view/my/child/VehicleManagement/child/AddTheCar/AddTheCar.dart';
import './HomeMap.dart';
import 'package:kaka_flutter_mp/view/home/parking/parking.dart';
import 'package:kaka_flutter_mp/http/httpUtil.dart';
import 'dart:async';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffeeeeee),
        child: new Column(
          children: <Widget>[
            IndexSwiper(),
            weather(),
            parkingBtn(context),
            IndexMap(),
          ],
        ),
      ),
    );
  }

  // 天气日期
  Widget weather(){
    return new Container(
      height: 46,
      color: Colors.white,
      padding: EdgeInsets.only(left: 22.0,right:22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // width: 180.0,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  MyIcons.icon1,
                  size: 20.0,
                  color: Color(0xfff4482ff),
                ),
                Text(
                  " 成都市 ",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff4482ff)
                  ),
                ),
                Text(
                  " 晴转多云 7°C",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff333333)
                  ),
                ),
              ],
            )
          ),
          Text('2019年01月09日 星期三'),
        ],
      ),
    );
  } 

  // 停车按钮
  Widget parkingBtn(context){
    return Container(
      margin: EdgeInsets.only(top: 12.0,bottom: 12.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child:new InkWell(
              onTap: (){
                Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Parking())
                );
              },
              child: MButton(
                button: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    "立即停车",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

// 轮播图
class IndexSwiper extends StatefulWidget{
  @override
  _IndexSwiper createState() => new _IndexSwiper();
}
class _IndexSwiper extends State<IndexSwiper>{
  List swipersArr;
  // 请求轮播图地址
  Future getSwiper() async {
    var response = await HttpUtil().get('/mp/config/swipers');
    print(response['result']);
    List swipers = response['result'];
    return swipers;
  }
  @override
  void initState() {
    super.initState();
    getSwiper().then((swipers) {
      setState(() {
        swipersArr = swipers;
      });
    });
  } 
  Widget build(BuildContext context){
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.28,
      child: Swiper(
        itemBuilder:_swiperBuilder,
        itemCount:3,
        index:1,//默认显示的图片
        autoplay: true,
        duration: 800,
        pagination:new SwiperPagination(
          builder:DotSwiperPaginationBuilder(//定义指示点
            color:Colors.black54,
            activeColor:Colors.white,
          ),
        ),
        control: new SwiperControl(),
        scrollDirection: Axis.horizontal,
        onTap:(int index) => print("当前点击第$index张图片"),
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    print(swipersArr); 
    List<Widget> imgArr = [];
    for(int i = 0;i<3;i++){
      imgArr.add(
          Image.network(
            swipersArr[0],
            fit: BoxFit.fill,
          )
      );
    }
    return  Wrap(
      children: imgArr,
    );
  }
}

