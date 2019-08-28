import 'package:flutter/material.dart';
import 'package:flutter_examples/example/immersion_status_bar_demo.dart';
import 'package:flutter_examples/example/clip_r_rect_demo.dart';
import 'package:flutter_examples/example/scroll_and_refresh_demo.dart';
import 'package:flutter_examples/example/input_demo.dart';
import 'package:flutter_examples/example/custom_scroll_demo.dart';
import 'package:flutter_examples/example/swiper_demo.dart';
import 'package:flutter_examples/example/transformer_page_view_demo.dart';
import 'package:flutter_examples/example/json_seri/json_serializable_demo.dart';
import 'package:flutter_examples/example/stretchable_text_view_demo.dart';
import 'package:flutter_examples/example/custom_sliver_header/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShellHong Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'ShellHong Flutter Demo'),
      routes: routers,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routerName[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),
    );
  }
}

const routerName = [
  "沉浸式状态栏例子(immersion statusBar demo)",
  "圆角例子(circular bead demo)",
  "下拉刷新和滚动加载例子(pull to refresh and scroll to load data)",
  "强制把输入字母转换为小写例子(forces the entered text to be lower case)",
  "伸缩头部与多种滚动容器复合(flexible header & wrap multiple scroll sliver)",
  "图片轮播之swiper实现(image carousel by swiper)",
  "图片轮播之transformer_page_view实现(image carousel by transformer_page_view)",
  "json格式请求结果反序列化与使用(dio & json_serializable demo)",
  "可伸缩文本组件例子(stretchable and shrinkable text view)",
  "CustomScrollView中SliverPersistentHeader的应用",
];

Map<String, WidgetBuilder> routers = {
  "widget/ImmersionStatusBarDemo": (context) {
    return new ImmersionStatusBarDemo();
  },
  "widget/ClipRRectDemo": (context) {
    return new ClipRRectDemo();
  },
  "widget/ScrollAndRefreshDemoPage": (context) {
    return new ScrollAndRefreshDemoPage();
  },
  "widget/InputDemoPage": (context) {
    return new InputDemoPage();
  },
  "widget/CustomScrollViewTestRoute": (context) {
    return new CustomScrollViewTestRoute();
  },
  "widget/SwiperDemoPage": (context) {
    return new SwiperDemoPage();
  },
  "widget/TransformerPageViewDemoPage": (context) {
    return new TransformerPageViewDemoPage();
  },
  "widget/JSONSerializableDemo": (context) {
    return new JSONSerializableDemo();
  },
  "widget/StretchableTextViewDemo": (context) {
    return new StretchableTextViewDemo();
  },
  "widget/CustomSSliverHeaderDemo": (context) {
    return new CustomSSliverHeaderDemo();
  },
};
