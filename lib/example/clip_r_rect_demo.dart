import 'package:flutter/material.dart';

class ClipRRectDemo extends StatefulWidget {
  @override
  _ClipRRectDemoState createState() => new _ClipRRectDemoState();
}

class _ClipRRectDemoState extends State<ClipRRectDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆角'),
      ),
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: new Image.asset(
                  "images/1.jpg",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text('circular bead demo'),
              Text('圆角例子'),
            ]
          ),
      )
    );
  }
}
