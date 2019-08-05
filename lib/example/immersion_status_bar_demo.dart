import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImmersionStatusBarDemo extends StatefulWidget {
  @override
  _ImmersionStatusBarDemoState createState() => new _ImmersionStatusBarDemoState();
}

class _ImmersionStatusBarDemoState extends State<ImmersionStatusBarDemo> {

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            // width: double.infinity,
            height: 0,
          ),
          preferredSize: Size(double.infinity, 0)
      ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
              end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
              colors: [Colors.lightBlue, Colors.red], // whitish to gray
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('immersion statusBar demo'),
              Text('沉浸式状态栏实例'),
            ]
          ),
      )
    );
  }
}
