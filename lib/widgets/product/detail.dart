import 'package:flutter/material.dart';
import '../../flutter_markdown/flutter_markdown.dart';
import 'package:dio/dio.dart';
import 'dart:io';
//import 'package:file_picker/file_picker.dart';

const String _sampleMarkdown = """
# Description Example
This is an example of how to use Markdown to description your product.
Markdown allows you to easily include formatted text, images, and even formatted code in your app.
## Titles
Setext-style
```
This is an H1
=============
This is an H2
-------------
```
Atx-style
```
# This is an H1
## This is an H2
###### This is an H6
```
Select the valid headers:
- [x] `# hello`
- [ ] `#hello`
## Links
[Google's Homepage][Google]
```
[inline-style](https://www.google.com)
[reference-style][Google]
```
## Images
![Flutter logo](/dart-lang/site-shared/master/src/_assets/image/flutter/icon/64.png)
## Tables
|Syntax                                 |Result                               |
|---------------------------------------|-------------------------------------|
|`*italic 1*`                           |*italic 1*                           |
|`_italic 2_`                           | _italic 2_                          |
|`**bold 1**`                           |**bold 1**                           |
|`__bold 2__`                           |__bold 2__                           |
|`This is a ~~strikethrough~~`          |This is a ~~strikethrough~~          |
|`***italic bold 1***`                  |***italic bold 1***                  |
|`___italic bold 2___`                  |___italic bold 2___                  |
|`***~~italic bold strikethrough 1~~***`|***~~italic bold strikethrough 1~~***|
|`~~***italic bold strikethrough 2***~~`|~~***italic bold strikethrough 2***~~|
## Styling
Style text as _italic_, __bold__, ~~strikethrough~~, or `inline code`.
- Use bulleted lists
- To better clarify
- Your points
## Code blocks
Formatted Dart code looks really pretty too:
```
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}
```
## Markdown widget
This is an example of how to create your own Markdown widget:
    Markdown(data: 'Hello _world_!');
Enjoy!
[Google]: https://www.google.com/
""";

final controller = ScrollController();
String _title = 'Sample Product 1';
String _markdownData = _sampleMarkdown;
final TextEditingController titleController = new TextEditingController(text: _title);
final TextEditingController descriptionController = new TextEditingController(text: _markdownData);

class Detail extends StatefulWidget {
  @override
  createState() => new DetailState();
}

class DetailState extends State<Detail> {
//  final _contexts = <Context>[new Context()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Product Detail'),
      ),
      body: _buildDescription(),
    );
  }

  Widget _buildDescription() {
    var readonly = true; //TODO 访问后端查询是否有权限修改
    if(readonly){
      return _buildReadonlyDescription();
    }else{
      return _buildEditableDescription();
    }
  }

  Widget _buildReadonlyDescription() {
    return Container(
      child: Row(
        children: <Widget>[
          //只读Markdown控件
          Expanded(
            child: new Markdown(
              controller: controller,
              selectable: true,
              data: _markdownData,
              imageDirectory: 'https://raw.githubusercontent.com',
            ),
          ),
          //侧边栏
          _buildSideBar(),
        ],
      ),
    );
  }

  Widget _buildSideBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          //订阅和关注栏
          _buildActionRow(),
          //打赏二维码
          _buildRewordPanel(),
          //tag列表展示
          _buildTagsList(),
        ],
      ),
    );
  }

  Widget _buildActionRow() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            onPressed: () {
              //TODO
            },
            child: new Text(
              '订阅',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            onPressed: () {
              //TODO
            },
            child: new Text(
              '关注',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRewordPanel() {
    const rewordQRCodeUrl = 'http://via.placeholder.com/350x150'; //TODO 打赏二维码
    return Container(
      margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: Column(
        children: <Widget>[
          Text('打赏作者'),
          Image(
            width: 250.0,
            image: NetworkImage(rewordQRCodeUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsList() {
    return Container(
      child: Column(
        children: <Widget>[
          //TODO 获取tag列表
          Text('tag1'),
          Text('tag2'),
        ],
      ),
    );
  }

  Widget _buildEditableDescription() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          //标题栏
          Container(
            child: new TextField(
              controller: titleController,
              decoration: new InputDecoration(
                hintText: 'Sample Product 1',
              ),
            ),
          ),
          //markdowm输入控件
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new TextField(
                      maxLines: 100,
                      controller: descriptionController,
                      decoration: new InputDecoration(
                        hintText: 'The description of your product ...',
                      ),
                      onChanged: (val) {
                        this.setState(() {
                          _markdownData = val;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: new Markdown(
                      controller: controller,
                      selectable: true,
                      data: _markdownData,
                      imageDirectory: 'https://raw.githubusercontent.com',
                    ),
                  ),
                ],
              ),
            )
          ),
          //发布按钮
          Container(
            child: new RaisedButton(
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () {
                upload();
              },
              child: new Text(
                '发布',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void upload() async {
//    File file = await FilePicker.getFile();
//    print(file.path);
    print("uploading");
    FormData formData = new FormData.fromMap({
      "title": titleController.text,
      "description": descriptionController.text,
      "file": await MultipartFile.fromFile("./a.txt",filename: "a.txt"),
    });
    print("post");
    Dio dio = Dio(BaseOptions(
      baseUrl: "http://172.19.240.145:8081",
      connectTimeout: 5000,
      receiveTimeout: 10000,
      // 5s
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: Headers.jsonContentType,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.json,
    ));
    try {
      Response response = await dio.post("/api", data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent/$total");
        },);
      print(response.data.toString());
    } on DioError catch (e) {
      print("error");
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response!=null) {
        print(e.response.statusCode);
        print(e.response.data);
//        print(e.response.headers);
//        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.type);
        print(e.toString());
        print(e.request);
        print(e.message);
      }
    }
  }
//
//  Widget _buildView() {
//    return new ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
//        // 在偶数行，该函数会为单词对添加一个ListTile row.
//        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
//        // 注意，在小屏幕上，分割线看起来可能比较吃力。
//        itemBuilder: (context, i) {
//          final index = i ~/ 2;
//          if (index<_contexts.length){
//            return _buildRow(_contexts[index]);
//          }
//          return null;
//        }
//    );
//  }
//
//  Widget _buildRow(Context context) {
//    return context;
//  }
//}
//
//class Context extends StatefulWidget {
//  @override
//  createState() => new ContextState();
//}
//
//class ContextState extends State<Context> {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Container(
//          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
//        ),
//        Container(
//          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
//        ),
//        Container(
//          child: FittedBox(
//            fit: BoxFit.contain, // otherwise the logo will be tiny
//            child: const FlutterLogo(),
//          ),
//        ),
//      ],
//    );
//  }
}
