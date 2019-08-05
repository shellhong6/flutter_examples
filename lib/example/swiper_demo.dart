import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// package doc: https://pub.dev/packages/flutter_swiper

class SwiperDemoPage extends StatefulWidget {
  @override
  _SwiperDemoPageState createState() =>
      new _SwiperDemoPageState();
}

class _SwiperDemoPageState extends State<SwiperDemoPage> {

  SwiperController controller = new SwiperController();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("图片轮播之swiper实现"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 5,left: 5),
                    child: new Image.network(
                      "http://via.placeholder.com/288x188",
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: 10,
                viewportFraction: .9,
                controller: controller
              ),
            )
          ],
        ),
      )
    );
  }
}