import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  createState() => new DetailState();
}

class DetailState extends State<Detail> {
  final _contexts = <Context>[new Context()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Product Detail'),
      ),
      body: _buildView(),
    );
  }

  Widget _buildView() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index<_contexts.length){
            return _buildRow(_contexts[index]);
          }
          return null;
        }
    );
  }

  Widget _buildRow(Context context) {
    return context;
  }
}

class Context extends StatefulWidget {
  @override
  createState() => new ContextState();
}

class ContextState extends State<Context> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('Deliver features faster', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
