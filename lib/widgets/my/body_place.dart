import 'package:flutter/material.dart';
import '../../mock/home_mock.dart';
import '../../const/my_page_const.dart';

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
                          // children: _buildContentItems(e['content']),
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

  List<Widget> _buildContentItems(List contentNames){
    List<Widget> contentItems = [];
    for (var item in contentNames) {
      contentItems.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Container(
              child: Column(
                children: <Widget>[
                  Image(
                    width: 200.0,
                    image: NetworkImage(item['imgUrl'])
                  ),
                  Text(item['name'])
                ],
              ),
            ),
            onPressed: () {
              //导航到新路由
              // Navigator.push( context,
              //   MaterialPageRoute(builder: (context) {
              //     return HomeSwiper();
              // }));
            }, 
          ),
        )
      );
    }
    for(int i = 0;i<6;i++)
    contentItems.add(
      Container(
        height: 0,
        width: 240.0,
      )
    );
    return contentItems;
  }
}