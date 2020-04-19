import 'package:flutter/material.dart';
import 'package:flutterdemo/HomePage.dart';
import 'package:flutterdemo/MallPage.dart';
import 'package:flutterdemo/UnknownPage.dart';
import 'package:flutterdemo/ListPage.dart';
import 'package:flutterdemo/CustomScrollPage.dart';
import 'package:flutterdemo/BasicPage.dart';
import 'package:flutterdemo/LayoutPage.dart';
import 'package:flutterdemo/CombinationPage.dart';
import 'package:flutterdemo/GesPage.dart';
import 'package:flutterdemo/dataTransfer/DataPage.dart';
import 'package:flutterdemo/animation/AnimationPage.dart';
import 'package:flutterdemo/News/NewsPage.dart';
import 'package:flutterdemo/MapView/MapPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.black,
        primaryColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.yellow),
        textTheme: TextTheme(body1: TextStyle(color: Colors.red))
//        primarySwatch: Colors.blue,
      ),
      routes: {
        "mallPage": (context) => MallPage(title: '商城首页',),
        "listPage": (context) => ListPage(),
        "customScrollPage": (context) => CustomScrollPage(),
        "basicPage": (context) => BasicPage(),
        "layoutPage": (context) => LayoutPage(),
        "combinationPage": (context) => CombinationPage(title: '组合与自绘',),
        "gesPage": (context) => GesPage(),
        "dataPage": (context) => DataPage(),
        'animationPage': (context) => AnimationPage(),
        'newsPage': (context) => NewsPage(),
        'mapPage': (context) => MapPage()
      }, // 注册路由
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnknownPage()),
      home: HomePage(),
    );
  }
}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            RaisedButton(
//              onPressed: () {
////                print('进入首页');
//              // 基本路由
//                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: '新首页',)));
//              },
//              child: Text(
//                  '进入首页'
//              ),
//            )
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
