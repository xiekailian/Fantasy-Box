import 'package:flutter/material.dart';
import 'widgets/home_swiper.dart';
import 'widgets/user_release_bar.dart';
import 'widgets/home_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fantasy Box'),
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

  TextEditingController searchController = TextEditingController();

  void _search([String str]) {
    print(searchController.text);
    setState(() {
      Navigator.push( context,
        MaterialPageRoute(builder: (context) {
          return HomeSwiper();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            width: 400.0,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8.0),
                icon: Icon(Icons.phone),
                labelText: '请输入你的用户名)',
              ),
              // onSubmitted: _search,
            ),
          ),
          Container(
            width: 40.0,
            child: FlatButton(
              onPressed: _search,
              padding: EdgeInsets.all(0.0),
              child: Icon(Icons.search)
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 0, 100.0, 0),
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
            child: Listener(
              child: CircleAvatar(
                backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
              ),
              onPointerUp: (PointerUpEvent event){
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) {
                    return HomeSwiper();
                }));
              },
            ),
          ),
        ],
      ),
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
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
