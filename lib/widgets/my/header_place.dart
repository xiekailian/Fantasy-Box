import 'package:fantasy_box/widgets/common/provider/changeNotifierProvider.dart';
import 'package:fantasy_box/widgets/common/provider/userModel.dart';
import 'package:flutter/material.dart';
import '../../util/colors_util.dart';

class HeaderPlace extends StatefulWidget {
  @override
  HeaderPlaceState createState() {
    return HeaderPlaceState();
  }
}

class HeaderPlaceState extends State<HeaderPlace> with SingleTickerProviderStateMixin {

  String avatarUrl;

  @override
  Widget build(BuildContext context) {
    avatarUrl = ChangeNotifierProvider.of<UserModel>(context).user.avatarUrl;
    print(avatarUrl);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/bg1.jpg"),fit: BoxFit.fill)
      ),
      //头像和昵称区域
      child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: Listener(
              child: Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(avatarUrl==null?'images/placeholder.jpg':avatarUrl),
                    fit: BoxFit.fill
                  ),

                  border: new Border.all(color: ColorsUtil.hexColor(0xffffff,opacity: 0.3), width: 3),
                  borderRadius: new BorderRadius.all(Radius.circular(40.0)),
                ),
              ),
              onPointerUp: (PointerUpEvent event){
                print('user');
                
              }
            ),
          ),
          Positioned(
            left: 120.0,
            top: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(ChangeNotifierProvider.of<UserModel>(context).user.username,textScaleFactor: 1.4),
                InkWell(
                  child: Text('注销',textScaleFactor: 0.8),
                  onTap: () {
                    //该赋值语句会触发MaterialApp rebuild
                    ChangeNotifierProvider.of<UserModel>(context).user = null;
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )        
        ],
      ),
    );
  }
}