import 'dart:async';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:fantasy_box/widgets/common/web_file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';

class WebImagePicker {
  WebFilePicker filePicker = new WebFilePicker();
  Map<String, dynamic> fileData;
  Image image;

  /// 只能在web环境使用。
  /// 调用浏览器的图片选择器，若用户多选，则只保留第一个文件。
  /// 返回一个Image对象
  Future<Image> pickImage() async {
    this.fileData = await filePicker.pickFile(accept: 'image/*');
    this.image = Image.memory(await filePicker.readAsArrayBuffer(), semanticLabel: fileData["name"]);
    return image;
  }

  Future<MultipartFile> transferToMultipartFile() async {
    return filePicker.transferToMultipartFile();
  }
}
