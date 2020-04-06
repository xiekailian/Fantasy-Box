import 'package:fantasy_box/widgets/home/home_swiper.dart';
import 'package:flutter/material.dart';

List<Widget> buildContentItems(BuildContext context,List contentNames){
  List<Widget> contentItems = [];
  for (var item in contentNames) {
    contentItems.add(
      Container(
        width: 240.0,
        // height: 190.0,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Container(
            child: Column(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: 'images/placeholder.jpg', 
                  image: item['imgUrl'],
                  // fit: BoxFit.fill,
                  height: 120.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new IconButton(
                        icon: CircleAvatar(
                          backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
                        ),
                        onPressed: null
                      ),
                      Text(item['name'])
                    ],
                  ),
                ),
                Text(item['name'])
              ],
            ),
          ),
          onPressed: () {
            //导航到新路由
            Navigator.push( context,
              MaterialPageRoute(builder: (context) {
                return HomeSwiper();
            }));
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

