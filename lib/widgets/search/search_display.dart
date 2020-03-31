import 'package:fantasy_box/widgets/common/contentItemsBuilder.dart';
import 'package:flutter/material.dart';
import '../../mock/home_mock.dart';

class SearchDisplay extends StatefulWidget {
  @override
  SearchDisplayState createState() {
    return SearchDisplayState();
  }
}

class SearchDisplayState extends State<SearchDisplay> with SingleTickerProviderStateMixin {
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
            color: Colors.lightBlue,
            child: TabBar(   //生成Tab菜单
              indicatorColor: Colors.white,
              controller: _tabController,
              tabs: typeList.map((e) => Tab(text: e['name'])).toList()
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.lightBlue[50],
              child: TabBarView(
                controller: _tabController,
                children: typeList.map((e) { //创建3个Tab页
                  return Container(
                    // alignment: Alignment.center,
                    // height: 100.0,
                    // width: 100.0,
                    child: ListView(
                      children: <Widget>[
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: buildContentItems(context,e['content']),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      )
    );
  }
}