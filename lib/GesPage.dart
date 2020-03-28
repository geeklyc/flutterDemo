import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GesPage extends StatefulWidget {
//  GesPage({Key key, this.title}) : super(key: key);
//  final String title;

  State<StatefulWidget> createState() => _GesPage();
}

class _GesPage extends State<GesPage> {
//红色container坐标
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势'),
      ),
      body:

      RawGestureDetector(//自己构造父Widget的手势识别映射关系
        gestures: {
          //建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的recognizer
          MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              MultipleTapGestureRecognizer>(
                () => MultipleTapGestureRecognizer(),
                (MultipleTapGestureRecognizer instance) {
              instance.onTap = () => print('parent tapped ');//点击回调
            },
          )
        },
        child: Container(
          color: Colors.pinkAccent,
          child: Center(
            child: GestureDetector(//子视图可以继续使用GestureDetector
              onTap: () => print('Child tapped'),
              child: GestureDetector(
                  onTap: () => print('Child tapped'),
                  child: Container(
                    color: Colors.blueAccent,
                    width: 200.0,
                    height: 200.0,
                  )),
            ),
          ),
        ),
      )
      ,
    );
  }
}

//Listener(
//child: Container(
//color: Colors.red,//背景色红色
//width: 300,
//height: 300,
//),
//onPointerDown: (event) => print("down $event"),//手势按下回调
//onPointerMove:  (event) => print("move $event"),//手势移动回调
//onPointerUp:  (event) => print("up $event"),//手势抬起回调
//)

//Stack(//使用Stack组件去叠加视图，便于直接控制视图坐标
//children: <Widget>[
//Positioned(
//top: _top,
//left: _left,
//child: GestureDetector(//手势识别
//child: Container(color: Colors.red,width: 50,height: 50),//红色子视图
//onTap: ()=>print("Tap"),//点击回调
//onDoubleTap: ()=>print("Double Tap"),//双击回调
//onLongPress: ()=>print("Long Press"),//长按回调
//onPanUpdate: (e) {//拖动回调
//setState(() {
////更新位置
//_left += e.delta.dx;
//_top += e.delta.dy;
//});
//},
//),
//)
//],
//)