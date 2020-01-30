import 'package:flutter/material.dart';

class HomeDisplay extends StatefulWidget {
  @override
  HomeDisplayState createState() {
    return HomeDisplayState();
  }
}

class HomeDisplayState extends State<HomeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildTypeTabs(),
    );
  }

  List<Widget> _buildTypeTabs(){
    List<Widget> typeTabs = [];
    List typeList = [{
      'name':'热门',
      'content':['热门1','热门2','热门3']
    },{
      'name':'游戏',
      'content':['游戏1','游戏2','游戏3']
    },{
      'name':'视频',
      'content':['视频1','视频2','视频3']
    },{
      'name':'图片',
      'content':['图片1','图片2','图片3']
    }];
    for (var item in typeList) {
      typeTabs.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Text(item['name']),
        )
      );
    }
    return typeTabs;
  }
}