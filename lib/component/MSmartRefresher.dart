import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

class MSmartRefresher extends StatefulWidget {
  final List<Widget> listData;
  final bool enablePullDown;
  final bool enablePullUp;

  MSmartRefresher({Key key,
    this.listData,
    this.enablePullDown = false,
    this.enablePullUp = false})
      : super(key: key);

  @override
  _MSmartRefresher createState() => new _MSmartRefresher();
}

class _MSmartRefresher extends State<MSmartRefresher> {
  RefreshController _refreshController = new RefreshController();

  Widget _buildHeader(context, mode) {
    return ClassicIndicator(
      idleText: "",
      completeText: "",
      failedText: "",
      noDataText: "",
      releaseText: "",
      refreshingText: "",
    );
  }

  Widget _buildFooter(context, mode) {
    return ClassicIndicator(
      completeText: " ",
      failedText: " ",
      noDataText: " ",
      releaseText: " ",
      refreshingText: " ",
      idleText: "",
    );
  }

  void _onRefresh(bool up) {
    if (up) {
      _refreshController.sendBack(true, 4);
    } else {
      //footerIndicator Callback
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: widget.enablePullDown,
        enablePullUp: widget.enablePullUp,
        onRefresh: _onRefresh,
        footerBuilder: _buildFooter,
        headerBuilder: _buildHeader,
        controller: _refreshController,
        child: ListView(
          children: widget.listData,
        ));
  }
}
