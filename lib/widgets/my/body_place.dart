import 'package:flutter/material.dart';
import '../../mock/home_mock.dart';
import '../../const/my_page_const.dart';
import '../common/upload_img_place.dart';

class BodyPlace extends StatefulWidget {
  @override
  BodyPlaceState createState() {
    return BodyPlaceState();
  }
}

class BodyPlaceState extends State<BodyPlace> with SingleTickerProviderStateMixin {
  TabController _tabController;
  // List typeList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myPageTabNames.length, vsync: this);
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
              tabs: myPageTabNames.map((e) => Tab(text: e)).toList()
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.lightBlue[50],
              child: TabBarView(
                controller: _tabController,
                children: myPageTabNames.map((e) {
                  return Container(
                    // alignment: Alignment.center,
                    // height: 100.0,
                    // width: 100.0,
                    child: ListView(
                      children: <Widget>[
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: _buildContentItems(),
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

  List<Widget> _buildContentItems(){
    List<Widget> contentItems = [];
    contentItems.add(
      Container(
        width: 200.0,
        height: 200.0,
        child: UploadImgPlace(),
      )
    );
    return contentItems;
  }
}