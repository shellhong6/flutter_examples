import 'package:flutter/material.dart';

class InputDemoPage extends StatefulWidget {
  @override
  _InputDemoPageState createState() => _InputDemoPageState();
}

class _InputDemoPageState extends State < InputDemoPage > {
  final _controller = TextEditingController();

  void initState() {
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("输入限制"),
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: < Widget > [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text('forces the entered text to be lower case')
            ],
          ),
      ),
    );
  }
}