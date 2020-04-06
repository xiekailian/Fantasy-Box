import 'package:fantasy_box/widgets/common/global.dart';
import 'package:fantasy_box/widgets/common/provider/ChangeNotifierProvider.dart';
import 'package:fantasy_box/widgets/common/provider/userModel.dart';
import 'package:fantasy_box/widgets/product/detail.dart';
import 'package:flutter/material.dart';
import 'widgets/home/home_swiper.dart';
import 'widgets/home/user_release_bar.dart';
import 'widgets/home/home_display.dart';
import 'widgets/common/navigator_bar.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>(
      data: UserModel(),
      child: MaterialApp(
        title: 'Fantasy Box',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(title: 'Fantasy Box'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: navigatorBar(context,title: 'Fantasy Box'),
      body:SingleChildScrollView(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            HomeSwiper(),
            UserReleaseBar(),
            HomeDisplay(),
          ],
        ),
      ), 
      
      floatingActionButton: FloatingActionButton(
        onPressed: _pushToProduct,
        tooltip: '去发布',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  void _pushToProduct() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Detail();
        },
      ),
    );
  }
}

