import 'package:flutter/material.dart';
import 'package:flutter_examples/example/flutter_stretchable_text_view.dart';

class StretchableTextViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("可伸缩文本组件例子"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Text('点击下边文字可进行展开或者收缩：',),
          SizedBox(
            height: 20,
          ),
          createItem(
            StretchableTextView(
              text: '凡人修仙，风云再起\n\n时空穿梭，轮回逆转\n\n金仙太乙，大罗道祖\n\n三千大道，法则至尊\n\n《凡人修仙传》仙界篇，一个韩立叱咤仙界的故事，一个凡人小子修仙的不灭传说。'
            ),
          ),
          SizedBox(
            height: 20,
          ),
          createItem(
            StretchableTextView(
              textStyle: TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
              text: '凡人修仙，风云再起\n\n时空穿梭，轮回逆转\n\n金仙太乙，大罗道祖\n\n三千大道，法则至尊\n\n《凡人修仙传》仙界篇，一个韩立叱咤仙界的故事，一个凡人小子修仙的不灭传说。'
            )
          ),
          SizedBox(
            height: 20,
          ),
          createItem(
            StretchableTextView(
              maxLines: 4,
              suffix: '......',
              spreadBtn: TextSpan(
                text: 'more',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              textStyle: TextStyle(
                height: 1.2,
                fontSize: 12,
                color: Colors.black,
              ),
              text: 'Flutter 是 Google推出并开源的移动应用开发框架，主打跨平台、高保真、高性能。开发者可以通过 Dart语言开发 App，一套代码同时运行在 iOS 和 Android平台。 Flutter提供了丰富的组件、接口，开发者可以很快地为 Flutter添加 native扩展。同时 Flutter还使用 Native引擎渲染视图，这无疑能为用户提供良好的体验。'
            )
          ),
        ]
      )
    );
  }
  DecoratedBox createItem (Widget widget) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: widget,
      ),
    );
  }
}