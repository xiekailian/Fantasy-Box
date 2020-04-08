import 'package:fantasy_box/flutter_markdown/flutter_markdown.dart';
import 'package:fantasy_box/util/http_util.dart';
import 'package:fantasy_box/widgets/common/web_file_picker.dart';
import 'package:fantasy_box/widgets/common/web_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


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
Image cover;
WebFilePicker filePicker = new WebFilePicker();
WebImagePicker imagePicker = new WebImagePicker();


class Detail extends StatefulWidget {
  @override
  createState() => new DetailState();

  Detail({
    Key key,
    this.readonly = false,
    this.id,
  }): assert(!readonly || id!=null),//浏览别人的产品：readonly=true，修改自己的产品：readonly=false，发布产品：readonly=false, id=null
        super(key:key);

  final bool readonly; //用户是否可用修改
  final String id; //目标产品的id
}

class DetailState extends State<Detail> {
//  final _contexts = <Context>[new Context()];

  @override
  Widget build(BuildContext context) {
    var appBarTitle = widget.readonly?'作品详情':_title;
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(appBarTitle),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: _buildDescription(widget.readonly),
      ),
    );
  }

  Widget _buildDescription(bool readonly) {
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
          //封面选择
          Container(
            height: 100,
            child: Row(
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () async {
                      final _image = await imagePicker.pickImage();
                      setState(() {
                        cover = _image;
                      });
                    },
                    child: Icon(Icons.open_in_browser),
                  ),
                  Center(child: cover != null ? cover : Text('...')),
                  new RaisedButton(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () async {
                      final Map<String, dynamic> data = await filePicker.pickFile();
                    },
                    child: Icon(Icons.open_in_browser),
                  ),
                ]
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
    //Dio 文档参考https://github.com/flutterchina/dio/blob/master/README-ZH.md
    print("uploading");
    final MultipartFile file = await filePicker.transferToMultipartFile();
    final MultipartFile coverFile = await imagePicker.transferToMultipartFile();
    if(coverFile==null){
      //TODO 提示用户还没上传封面
      return;
    }
    if(file==null){
      //TODO 提示用户还没上传文件
      return;
    }
    FormData formData = new FormData.fromMap({
      "title": titleController.text,
      "description": descriptionController.text,
      "file": file,
      "cover": coverFile,
      "tags": "tag1,tag2",
    });
    print("post");
    Dio dio = baseDio();
    try {
      Response response = await dio.post("/api/product/post-product", data: formData,
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
