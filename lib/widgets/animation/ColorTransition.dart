import 'package:flutter/material.dart';

class ColorTransition extends StatelessWidget {
  ColorTransition({this.child, this.animation1, this.animation2, this.controller});

  final Widget child;
  final Animation<Color> animation1;
  final Animation<Color> animation2;
  final AnimationController controller;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                // gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]])
                gradient: LinearGradient(colors: [animation2.value,animation1.value])
              ),
              // color: animation.value,
              // width: MediaQuery.of(context).size.width,
              child: child
            );
            // return new Container(
            //     height: animation.value, 
            //     width: animation.value, 
            //     child: child
            // );
          },
          child: child
      ),
    );
  }
}