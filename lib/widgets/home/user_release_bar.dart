import 'package:fantasy_box/widgets/animation/ColorTransition.dart';
import 'package:fantasy_box/widgets/product/detail.dart';
import 'package:flutter/material.dart';

class UserReleaseBar extends StatefulWidget {
  @override
  UserReleaseBarState createState() {
    return UserReleaseBarState();
  }
}

class UserReleaseBarState extends State<UserReleaseBar> with SingleTickerProviderStateMixin {

  Animation<Color> animation1;
  Animation<Color> animation2;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //颜色渐变动画
    animation1 = new ColorTween(begin: Colors.yellow[100], end: Colors.orange[800]).animate(animationController)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        animationController.forward();
      }
    });
    animation2 = new ColorTween(begin: Colors.orange[800], end: Colors.yellow[100]).animate(animationController)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        animationController.forward();
      }
    });
    // animation = new Tween(begin: 0.0, end: 300.0).animate(animationController);
    //启动动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.new_releases),
        // Text(
        //   '这就去发布'
        // ),
        Expanded(
          child: InkWell(
            // padding: EdgeInsets.all(0),
            child: ColorTransition(
              animation1: animation1,
              animation2: animation2,
              controller: animationController,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.control_point),
                  Text(
                    '这就去发布'
                  ),
                ],
              ),
            ),
            // child: Container(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   // width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Icon(Icons.new_releases),
            //       Text(
            //         '这就去发布'
            //       ),
            //     ],
            //   )
            // ),
            onTap: _pushToProduct
          ),
        ),
        //最重要的发布产品按钮区域
      ],
    );
  }

  void _pushToProduct() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Detail();
        },
      ),
    );
  }
}