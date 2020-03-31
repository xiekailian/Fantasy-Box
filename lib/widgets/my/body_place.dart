import 'package:fantasy_box/widgets/common/contentItemsBuilder.dart';
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
        // mainAxisSize: MainAxisSize.min,
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
                  if(e == '主页'){
                    return Container(
                      child: ListView(
                        children: <Widget>[
                          Wrap(
                            // alignment: WrapAlignment.spaceAround,
                            children: _buildContentItems(),
                          )
                        ],
                      ),
                    );
                  }else if(e == '收藏集'){
                    return Container(
                      child: ListView(
                        children: <Widget>[
                          Wrap(
                            // alignment: WrapAlignment.spaceAround,
                            children: buildContentItems(context,typeList[0]['content']),
                          )
                        ],
                      ),
                    );
                  }
                  
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
    contentItems.add(UploadImgPlace());
    return contentItems;
  }
}