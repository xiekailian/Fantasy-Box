import 'package:fantasy_box/widgets/common/contentItemsBuilder.dart';
import 'package:flutter/material.dart';
import 'home_swiper.dart';
import '../../mock/home_mock.dart';

class HomeDisplay extends StatefulWidget {
  @override
  HomeDisplayState createState() {
    return HomeDisplayState();
  }
}

class HomeDisplayState extends State<HomeDisplay> with SingleTickerProviderStateMixin {
  TabController _tabController;
  // List typeList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: typeList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      // width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: TabBar(   //生成Tab菜单
              indicatorColor: Colors.yellow,
              controller: _tabController,
              tabs: typeList.map((e) => Tab(text: e['name'])).toList()
            ),
          ),
          Container(
            height: 400.0,
            color: Colors.white,
            child: TabBarView(
              controller: _tabController,
              children: typeList.map((e) { //创建3个Tab页
                return Container(
                  // alignment: Alignment.center,
                  // height: 100.0,
                  // width: 100.0,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: buildContentItems(context,e['content']),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}