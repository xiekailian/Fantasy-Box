import 'package:flutter/cupertino.dart';

class ColorsUtil {
   /// 十六进制颜色，
   /// hex, 十六进制值，例如：0xffffff,
   /// alpha, 透明度 [0.0,1.0]
   static Color hexColor(int hex,{double opacity = 1}){
    if (opacity < 0){
      opacity = 0;
    }else if (opacity > 1){
      opacity = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
         (hex & 0x00FF00) >> 8,
         (hex & 0x0000FF) >> 0,
         opacity);
   }
}