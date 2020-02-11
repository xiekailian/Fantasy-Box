import 'package:flutter/material.dart';
import '../../util/colors_util.dart';

class HeaderPlace extends StatefulWidget {
  @override
  HeaderPlaceState createState() {
    return HeaderPlaceState();
  }
}

class HeaderPlaceState extends State<HeaderPlace> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("http://via.placeholder.com/350x150"),fit: BoxFit.fill)
      ),
      child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("http://via.placeholder.com/350x150"),fit: BoxFit.fill),
                border: new Border.all(color: ColorsUtil.hexColor(0xffffff,opacity: 0.3), width: 3),
                borderRadius: new BorderRadius.all(Radius.circular(40.0)),
              ),
            ),
          ),
          Positioned(
            left: 120.0,
            bottom: 60.0,
            child: Text("----你的名字----",textScaleFactor: 1.4),
          )        
        ],
      ),
    );
  }
}