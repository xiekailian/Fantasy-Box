import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  @override
  HomeSwiperState createState() {
    return HomeSwiperState();
  }
}

class HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: new Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://via.placeholder.com/350x150",
      fit: BoxFit.fill,
    ));
  }
}