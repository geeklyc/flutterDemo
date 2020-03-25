import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {

  // Container 只能包含一个Widget
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('新首页'),
        ),
        body:
        Stack(
          children: <Widget>[
            Container(color: Colors.yellow, width: 300, height: 300),//黄色容器
            Positioned(
              left: 18.0,
              top: 18.0,
              child: Container(color: Colors.green, width: 50, height: 50),//叠加在黄色容器之上的绿色控件
            ),
            Positioned(
              left: 18.0,
              top:70.0,
              child: Text("Stack提供了层叠布局的容器"),//叠加在黄色容器之上的文本
            )
          ],
        )
    );
  }
}

//Row(
//children: <Widget>[
//Expanded(flex: 1, child: Container(color: Colors.yellow, height: 60)), //设置了flex=1，因此宽度由Expanded来分配
//Container(color: Colors.red, width: 100, height: 180,),
//Container(color: Colors.black, width: 60, height: 80,),
//Expanded(flex: 1, child: Container(color: Colors.green,height: 60),)/设置了flex=1，因此宽度由Expanded来分配
//],
//);

//Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround, //由于容器与子Widget一样宽，因此这行设置排列间距的代码并未起作用
////          mainAxisSize: MainAxisSize.min, //让容器宽度与所有子Widget的宽度一致
//children: <Widget>[
//Container(color: Colors.yellow, width: 60, height: 80,),
//Container(color: Colors.red, width: 100, height: 180,),
//Container(color: Colors.black, width: 60, height: 80,),
//Container(color: Colors.green, width: 60, height: 80,),
//],
//)

//
//Padding(
//padding: EdgeInsets.all(44.0),
//child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。'),
//);


//Scaffold(
//body: Center(child: Text("Hello")) // This trailing comma makes auto-formatting nicer for build methods.
//);