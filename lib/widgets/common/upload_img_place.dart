import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fantasy_box/util/dialog_util.dart';
import 'package:fantasy_box/util/http_util.dart';
import 'package:fantasy_box/widgets/common/web_image_picker.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';//toast
import 'package:image_picker/image_picker.dart';//从相册里面选择图片或者拍照获取照片
class UploadImgPlace extends StatefulWidget {
  @override
  _UploadImgPlaceState createState() => _UploadImgPlaceState();
}

class _UploadImgPlaceState extends State<UploadImgPlace> {
  Image _image;
  WebImagePicker imagePicker = new WebImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 250.0,
      color: Colors.yellow[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: _image == null
              ? Text('请上传收款二维码')
              : Image(
              image: _image.image,
              fit: BoxFit.fill,
              width: 200,
              height: 200,
            ),
          ),
          FlatButton(
            onPressed: () async {
              final image = await imagePicker.pickImage();
              _upLoadImage();
              setState(() {
                _image = image;
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
//上传图片
  _upLoadImage() async {
    final MultipartFile imageFile = await imagePicker.transferToMultipartFile();
    FormData formData = new FormData.fromMap({
      "qr-code": imageFile,
    });
    Dio dio = baseDio();
    try {
      Response response = await dio.post("/api/user/modify-qr", data: formData);
      print(response.data);
      showToast("上传成功",context);
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