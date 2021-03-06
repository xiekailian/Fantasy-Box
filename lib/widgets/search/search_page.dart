import 'package:flutter/material.dart';
import '../common/navigator_bar.dart';
import './search_display.dart';

class SearchPage extends StatefulWidget {

  List productContentList;
  SearchPage(this.productContentList);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: navigatorBar(context,title: 'Search Products'),
      // body:Text(widget.productList.toString()), 
      body:SearchDisplay(widget.productContentList),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

