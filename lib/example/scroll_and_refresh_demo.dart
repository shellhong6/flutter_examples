import 'package:flutter/material.dart';
import 'dart:async';

class ScrollAndRefreshDemoPage extends StatefulWidget {
  @override
  _ScrollAndRefreshDemoPageState createState() => _ScrollAndRefreshDemoPageState();
}

class _ScrollAndRefreshDemoPageState extends State<ScrollAndRefreshDemoPage> {
  final ScrollController _scrollController = new ScrollController();

  List data = [];
  bool isLoading = false;
  int prefix = 0;

  @override
  void initState() {
    _getMore();
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        var isEnd = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
        if (isEnd) {
          _getMore();
        }
      });
    });
  }

  Future _handleRefresh() async {
    prefix += 1;
    return _getMore(isRefresh:true);
  }

  Future _getMore({bool isRefresh=false}) async {
    if (!isLoading) {
      if (this.data.length > 0) {
        setState(() {
          isLoading = true;
        });
      }
    } else {
      return;
    }
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      if (isRefresh) {
        data.clear();
      }
      data.addAll(List.generate(10, (i){
        if (data.length == 0 && i == 0) {
          return 0;
        }
        return i + data.length;
      }));
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("滚动加载"),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: new ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == data.length) {
              return Visibility(
                visible: isLoading,
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("加载中..."),
                  ),
                )
              );
            } 
            return Card(
              child: new Container(
                height: 60,
                alignment: Alignment.centerLeft,
                child: new Text("Item ${this.prefix}_${data[index]}"),
              ),
            );
          },
          itemCount: data.length + 1,
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
