import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_examples/example/json_seri/remote_models/homepage_list.dart';


class JSONSerializableDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JSONSerializableDemoState();
  }
}

class JSONSerializableDemoState extends State<JSONSerializableDemo>
    with SingleTickerProviderStateMixin {
  
  static const String homepageList = 'http://blog.shellhong.com/demo/api/book_homepage/homepage_list.json';
  String title = '';
  bool isFinish = false;
  HomepageList homePageList;

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio & json_serializable demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(isFinish ? '接口请求和处理完成' : "处理中..."),
          SizedBox(height: 10,),
          Text(isFinish ? '读取homePageList.value[0].modules[0].items[1].title的值：${homePageList.value[0].modules[0].items[1].title}' : ''),
          SizedBox(height: 10,),
          Text(isFinish ? '具体请参考源码' : '')
        ],
        ),
    );
  }

  getData() async {
    Dio _dio = new Dio();
    try {
      Response response = await _dio.get(homepageList);
      String res = response.toString();
      Map<String ,dynamic> map = json.decode(res);
      // print('map--${map.entries.elementAt(2).value[0].entries.elementAt(5).value[0].entries.elementAt(11).value[1].entries.elementAt(0).value}');
      homePageList = HomepageList.fromJson(map);
      isFinish = true;
      this.setState((){});
    } catch (err){
      print(err);
      return null;
    }
  }
}