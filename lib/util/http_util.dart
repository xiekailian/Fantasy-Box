import 'dart:html';
import 'dart:io';
import 'package:dio/dio.dart';

void httpGet() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

Dio baseDio() {
  Dio dio = Dio(BaseOptions(
//      baseUrl: "http://172.19.240.145:8081",
    baseUrl: "http://localhost:8080",
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
  return dio;
}

void newTab(String url){
  window.open(url, '下载作品');
}