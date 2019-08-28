import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final dynamic title;
  final Function getTitleBarExtendWidgets;
  final Function getContentExtendWidgets;
  String statusBarMode = 'dark';

  SliverHeaderDelegate({
    this.collapsedHeight = 40,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
    this.getTitleBarExtendWidgets,
    this.getContentExtendWidgets
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    double limit = this.collapsedHeight + 10;
    if(shrinkOffset > limit && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if(shrinkOffset <= limit && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    double limit = this.collapsedHeight + 10;
    if(shrinkOffset <= limit) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  Widget getTitle (Color color) {
    if (this.title is String) {
      return Text(
        this.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      );
    }
    return this.title(color);
  }

  List<Widget> getTitleBarWidgets (double shrinkOffset, BuildContext context) {
    Color iconColor = this.makeStickyHeaderTextColor(shrinkOffset, true);
    Color textColor = this.makeStickyHeaderTextColor(shrinkOffset, false);
    List<Widget> titleBarWidgets = [
      IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: iconColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      Expanded(
        child: this.getTitle(textColor),
      ),
    ];
    List<Widget> extendWidget = [];
    if (this.getTitleBarExtendWidgets != null) {
      extendWidget = this.getTitleBarExtendWidgets(iconColor, textColor);
    }
    extendWidget.forEach((widget) {
      titleBarWidgets.add(widget);
    });
    return titleBarWidgets;
  }

  List<Widget> getContentWidgets (double shrinkOffset, BuildContext context) {
    List<Widget> titleBarWidgets = this.getTitleBarWidgets(shrinkOffset, context);
    List<Widget> contentWidgets = <Widget>[
      Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
    ];
    List<Widget> extendWidget = [];
    if (this.getContentExtendWidgets != null) {
      extendWidget = this.getContentExtendWidgets(shrinkOffset, context);
    }
    extendWidget.forEach((widget) {
      contentWidgets.add(widget);
    });
    contentWidgets.addAll([
      Positioned(
        left: 0,
        top: this.maxExtent / 2,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x00000000),
                Color(0x90000000),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Container(
          color: this.makeStickyHeaderBgColor(shrinkOffset),
          child: SafeArea(
            bottom: false,
            child: Container(
              height: this.collapsedHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: titleBarWidgets,
              ),
            ),
          ),
        ),
      ),
    ]);
    return contentWidgets;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: this.getContentWidgets(shrinkOffset, context),
      ),
    );
  }
}