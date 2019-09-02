import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => new _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin{
  double count1 = 0;
  int count2 = 0;
  double fontSize = 0;
  Color color;
  bool isForward = false;
  AnimationController controller;
  Animation<int> alpha;
  Animation<double> fontSizeAnimation;
  Animation<Color> colorAnimation;
    
  @override
  void initState() {
    controller = new AnimationController(
      duration: const Duration(milliseconds: 15000), 
      vsync: this
    );
    CurvedAnimation curvedAnimation1 = new CurvedAnimation(parent: controller, curve: Interval(
      0.0, 0.6,//间隔，前60%的动画时间
      curve: Curves.easeIn,
    ));
    CurvedAnimation curvedAnimation2 = new CurvedAnimation(parent: controller, curve: Interval(
      0.6, 1.0,//间隔，前60%的动画时间
      curve: Curves.easeOut,
    ));
    alpha = new IntTween(begin: 0, end: 255).animate(curvedAnimation1);
    fontSizeAnimation = new Tween<double>(begin: 12, end: 30).animate(curvedAnimation2);
    colorAnimation = new ColorTween(begin: Colors.white, end: Colors.redAccent).animate(curvedAnimation1);
    controller.addListener(() {
      count1 = controller.value;
      count2 = alpha.value;
      color = colorAnimation.value;
      fontSize = fontSizeAnimation.value;
      this.setState((){});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画一'),
      ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            if (!isForward) {
              this.controller.forward();
            } else {
              this.controller.reverse();
            }
            isForward = !isForward;
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: color
            ),
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(count1.toString()),
                  Text(count2.toString(), 
                    style: TextStyle(
                      fontSize: fontSize
                    ),
                  )
                ],
              ),
            )
          ),
        )
        
    );
  }
}
