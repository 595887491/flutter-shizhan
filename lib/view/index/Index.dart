import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';
import 'package:kaka_flutter_mp/style/MIcon.dart';
import 'package:kaka_flutter_mp/view/home/Home.dart';
import 'package:kaka_flutter_mp/view/my/My.dart';
import 'package:kaka_flutter_mp/view/order/Order.dart';
import 'package:kaka_flutter_mp/view/wallet/Wallet.dart';


/// 创建一个 带有状态的 Widget Index
class Index extends StatefulWidget {
  final int pageindex;

  Index({Key key, this.pageindex}) : super(key: key);

  ///  固定的写法
  @override
  State<StatefulWidget> createState() => _IndexState();
}

/// 要让主页面 Index 支持动效，要在它的定义中附加mixin类型的对象TickerProviderStateMixin
class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _tabIndex = 0;
  var _tabIcons;
  List<String> _appBarTitles = ['停车', '订单', '钱包', '我的'];
  List<String> _titles = ["智慧停车", "订单", "钱包", "个人中心"];

  ///  存放页面，跟fragmentList一样 // 用来存放我们的图标对应的页面
  List<StatelessWidget> _pageList;

  /// 根据选择获得对应的normal或是press的icon
  Icon getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabIcons[curIndex][1];
    }
    return _tabIcons[curIndex][0];
  }

  /// 获取bottomTab的颜色和文字
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(_appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return Text(_appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  void initData() {
    /// 初始化选中和未选中的icon
    _tabIcons = [
      [Icon(MIcons.tingcheb), Icon(MIcons.tingcheh)],
      [Icon(MIcons.dingdanb), Icon(MIcons.dingdanh)],
      [Icon(MIcons.qianbaob), Icon(MIcons.qianbaoh)],
      [Icon(MIcons.myb), Icon(MIcons.myh)],
    ];

    /// 四个子页面
    _pageList = [
      Home(),
      Order(),
      Wallet(),
      My(
        jumppage: jumppage,
      ),
    ];
  }

  Widget appBar;

  /// 方法传入子页面，在子页面调用该方法改变该页面的值
  jumppage(index) {
    print(index);
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 初始化数据
    initData();
    return Scaffold(
        appBar: MAppBar(
          title: Text(_titles[_tabIndex]),
        ).build(context),
        body: _pageList[_tabIndex],
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],

          /// 默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,

          /// 点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}
