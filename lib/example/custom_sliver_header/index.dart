import 'package:flutter/material.dart';
import 'package:flutter_examples/example/custom_sliver_header/sliver_header_delegate_widget.dart';

class CustomSSliverHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              title: 'CustomScrollView中SliverPersistentHeader的应用',
              expandedHeight: 300,
              paddingTop: MediaQuery.of(context).padding.top,
              coverImgUrl: 'http://blog.shellhong.com/demo/api/book_homepage/images/1.png',
              getTitleBarExtendWidgets: (Color iconColor, Color textColor) {
                return <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: iconColor,
                    ),
                    onPressed: () {},
                  ),
                ];
              },
              getContentExtendWidgets: (double shrinkOffset, BuildContext context) {
                return <Widget>[
                  Positioned(
                    left: 50,
                    top: 100 - shrinkOffset * .3,
                    child: SizedBox(
                      width: 90,
                      height: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        child: Image.network('http://blog.shellhong.com/demo/api/book_homepage/images/755156.jpg', fit: BoxFit.cover),
                      )
                    )
                  )
                ];
              }
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}