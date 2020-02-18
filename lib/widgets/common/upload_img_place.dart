import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';//toast
import 'package:image_picker/image_picker.dart';//从相册里面选择图片或者拍照获取照片
class UploadImgPlace extends StatefulWidget {
  @override
  _UploadImgPlaceState createState() => _UploadImgPlaceState();
}

class _UploadImgPlaceState extends State<UploadImgPlace> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image);//上传图片
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
//上传图片
  _upLoadImage(File image) async {
    // ShopPaperImgDao.uploadImg(image).then((res){
    //   if(res['code'] == 200){
    //     // 上传成功
    //   }else{}
    // }).catchError((e){
    //   print(e.toString());
    // });
    // String path = image.path;
    // var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    // FormData formData = new FormData.fromMap({
    //   "file": new UploadFileInfo(new File(path), name)
    // });
    // Dio dio = new Dio();
    // var respone = await dio.post<String>("路径", data: formData);
    // if (respone.statusCode == 200) {
    //   Fluttertoast.showToast(
    //       msg: "图片上传成功",
    //       gravity: ToastGravity.CENTER,
    //       textColor: Colors.grey);
    // }
  }

    static Future uploadImg(imgfile) async{
      // String path = imgfile.path;
      // var name = path.substring(path.lastIndexOf("/") + 1, path.length);
      // FormData formData = new FormData.from({
      //   "file": new UploadFileInfo(new File(path), name)
      // });
      // Response response;
      // Dio dio =new Dio();
      // response =await dio.post('后端接口',data: formData);
      // if(response.statusCode == 200){
      //   return response.data;
      // }else{
      //   throw Exception('后端接口异常');
      // }
    }
}