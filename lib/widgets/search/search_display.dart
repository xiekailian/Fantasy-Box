import 'package:fantasy_box/widgets/common/itemsBuilder.dart';
import 'package:flutter/material.dart';
import '../../mock/home_mock.dart';

class SearchDisplay extends StatefulWidget {
  List productContentList;

  SearchDisplay(this.productContentList){
    print('xxxxxxxx');
    print(productContentList);
  }

  @override
  SearchDisplayState createState() {
    return SearchDisplayState();
  }
}

class SearchDisplayState extends State<SearchDisplay> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      // height: 100.0,
      // width: 100.0,
      child: ListView(
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: buildContentItems(context,widget.productContentList),
          )
        ],
      )
    );
  }
}