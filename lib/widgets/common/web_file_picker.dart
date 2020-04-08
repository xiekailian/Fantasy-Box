import 'dart:async';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class WebFilePicker {
  Map<String, dynamic> fileData;

  /// 只能在web环境使用。
  /// 调用浏览器的文件选择器，若用户多选，则只保留第一个文件。
  /// 返回的格式示例如下：
  /// {
  ///    "name": "a.text", //String类型，文件名
  ///    "data": file, //dart:html中的File对象，文件对象
  ///    "path": "", //文件的相对路径，目前还获取不到
  ///  }
  Future<Map<String, dynamic>> pickFile({String accept = '*'}) async {
    final Map<String, dynamic> data = {};
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input..accept = accept;
    input.click();
    await input.onChange.first;
    if (input.files.isEmpty) return null;

    data.addAll({'name': input.files[0].name, 'data': input.files[0], 'path': input.files[0].relativePath});
    this.fileData = data;
    return data;
  }

  /// 使用FileReader异步按字节读取文件内容，结果用ArrayBuffer对象表示。
  /// 警告：这里使用同步读，会阻塞后面的代码，只能在文件大小不大的情况下使用
  /// 如果尚未选择文件就调用此方法，会直接返回null
  Future<List<int>> readAsArrayBuffer() async {
    if(fileData==null){
      return null;
    }
    final reader = new html.FileReader();
    reader.readAsArrayBuffer(fileData["data"]);
    await reader.onLoad.first;
    final bytes = reader.result as List<int>;
    return bytes;
  }

  Future<MultipartFile> transferToMultipartFile() async {
    final bytes = await readAsArrayBuffer();
    if(bytes==null){
      return null;
    }
    return await MultipartFile.fromBytes(bytes,filename: fileData["name"],contentType: MediaType('multipart', 'form-data'));
  }
}
