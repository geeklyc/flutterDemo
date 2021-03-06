import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/MallPage.dart';
import 'dart:isolate';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => _HomePage();
}



class _HomePage extends State<HomePage> {
  String _msg = '';

//  Future<String> fetchContent() =>
//      Future<String>.delayed(Duration(seconds:3), () => "Hello")
//          .then((x) => "$x 2019");

//  //声明了一个延迟2秒返回Hello的Future，并注册了一个then返回拼接后的Hello 2019
//  Future<String> fetchContent() =>
//      Future<String>.delayed(Duration(seconds:2), () => "Hello")
//          .then((x) => "$x 2019");
////异步函数会同步等待Hello 2019的返回，并打印
//  func() async => print(await fetchContent());


  get() async {
    //创建网络调用示例，设置通用请求行为(超时时间)
    var httpClient = HttpClient();
    httpClient.idleTimeout = Duration(seconds: 5);

    //构造URI，设置user-agent为"Custom-UA"
    var uri = Uri.parse("https://flutter.dev");
    var request = await httpClient.getUrl(uri);
    request.headers.add("user-agent", "Custom-UA");

    //发起请求，等待响应
    var response = await request.close();

    //收到响应，打印结果
    if (response.statusCode == HttpStatus.ok) {
      print(await response.transform(utf8.decoder).join());
    } else {
      print('Error: \nHttp status ${response.statusCode}');
    }
  }

  void getRequest() async {
    // 创建网络调用示例
    Dio dio = new Dio();
    // 设置URI及请求user-agent后发起请求
    var response = await dio.get("https://flutter.dev", options: Options(
      headers: {
        "user-agent": "Custom-UA"
      }
    ));
    // 打印请求结果
    if (response.statusCode == HttpStatus.ok) {
      print("成功 ${response.data.toString()}");
    } else {
      print("错误 ${response.statusCode}");
    }
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://v.juhe.cn/toutiao/index?key=5b4d54e80de8d532805bfc91d4c1e4c3&type=top");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  // 配置方法通道
  final platform = MethodChannel('samples.lyc/utils');
  // 配置异步方法
  openMarket() async {
    int result;
    try {
      result = await platform.invokeMethod('openAppMarket', <String, dynamic> {
        'appId': 'com.cmbc.test',
        'packageName': '测试包',
      });
    } catch(e) {
      result = -1;
    }
    print("Result: $result");
  }





  @override
  Widget build(BuildContext context) {
//    print(formatDate(DateTime.now(), [mm, '月', dd, '日', hh, ':', n]));
//    print(formatDate(DateTime.now(), [m, '月第', w, '周']));


//    Future(() => print('Running in Future 1'));//下一个事件循环输出字符串
//
//    Future(() => print('Running in Future 2'))
//        .then((_) => print('and then 1'))
//        .then((_) => print('and then 2'));
//        //上一个事件循环结束后，连续输出三段字符串


////f1比f2先执行
//    Future(() => print('f1'));
//    Future(() => print('f2'));
//
////f3执行后会立刻同步执行then 3
//    Future(() => print('f3')).then((_) => print('then 3'));
//
////then 4会加入微任务队列，尽快执行
//    Future(() => null).then((_) => print('then 4'));

//    Future(() => print('f1'));//声明一个匿名Future
//    Future fx = Future(() =>  null);//声明Future fx，其执行体为null
//
////声明一个匿名Future，并注册了两个then。在第一个then回调里启动了一个微任务
//    Future(() => print('f2')).then((_) {
//      print('f3');
//      scheduleMicrotask(() => print('f4'));
//    }).then((_) => print('f5'));
//
////声明了一个匿名Future，并注册了两个then。第一个then是一个Future
//    Future(() => print('f6'))
//        .then((_) => Future(() => print('f7')))
//        .then((_) => print('f8'));
//
////声明了一个匿名Future
//    Future(() => print('f9'));
//
////往执行体为null的fx注册了了一个then
//    fx.then((_) => print('f10'));
//
////启动一个微任务
//    scheduleMicrotask(() => print('f11'));
//    print('f12');


//声明了一个延迟3秒返回Hello的Future，并注册了一个then返回拼接后的Hello 2019

//    print(fetchContent());


//    Future(() => print('f1'))
//        .then((_) async => await Future(() => print('f2')))
//        .then((_) => print('f3'));
//    Future(() => print('f4'));




//    print("func before");
//    func();
//    print("func after");

    return new Scaffold(
      appBar: AppBar(
        title: Text('新首页'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
//              Container(
//                child: ClipRRect(
//                  child: Image.asset('assets/common/headicon.jpeg', width: 80, height: 80,),
//                ),
//              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Get网络'),
                    onPressed: () => get()
                  ),
                  RaisedButton(
                    child: Text('Dio请求'),
                    onPressed: () => getRequest(),
                  ),
                  RaisedButton(
                    child: Text('Dio GET请求'),
                    onPressed: () => getHttp(),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('调用原生方法'),
                    onPressed: () => openMarket(),
                  ),
                  RaisedButton(
                    child: Text('调用原生地图'),
                    onPressed: () => Navigator.pushNamed(context, 'mapPage'),
                  )
                ],
              ),

//              Theme(
//                data: ThemeData(iconTheme: IconThemeData(color: Colors.red)),
//                child: Icon(Icons.favorite),
//              ),
//              Theme(
//                data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.green)),
//                child: Icon(Icons.feedback),
//              ),
//              Container(
//                color: Theme.of(context).primaryColor,
//                child: Text(
//                  'Text With',
//                  style: Theme.of(context).textTheme.title,
//                ),
//              ),
              RaisedButton(
                child: Text('基本路由'),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MallPage(title: '商城',))),
              ),
              RaisedButton(
                child: Text('命名路由'),
                onPressed: () => Navigator.pushNamed(context, 'mallPage'),
              ),
              RaisedButton(
                child: Text('命名路由（参数&回调）'),
                onPressed: () =>
                    Navigator.pushNamed(context, 'mallPage', arguments: 'Hey')
                        .then((msg) {
                      setState(() {
                        _msg = msg;
                      });
                    }),
              ),
              Text('商城页面传回来：$_msg'),
              RaisedButton(
                child: Text('命名路由异常处理'),
                onPressed: () => Navigator.pushNamed(context, 'unknowPage'),
              ),
              RaisedButton(
                child: Text('ListView 使用'),
                onPressed: () => Navigator.pushNamed(context, 'listPage'),
              ),
              RaisedButton(
                child: Text('CustomScrollPage 使用'),
                onPressed: () => Navigator.pushNamed(context, 'customScrollPage'),
              ),
              RaisedButton(
                child: Text('Text, Button, Image 使用'),
                onPressed: () => Navigator.pushNamed(context, 'basicPage'),
              ),
              RaisedButton(
                child: Text('Layout 使用'),
                onPressed: () => Navigator.pushNamed(context, 'layoutPage'),
              ),
              RaisedButton(
                child: Text('组合与自绘 使用'),
                onPressed: () => Navigator.pushNamed(context, 'combinationPage'),
              ),
              RaisedButton(
                child: Text('手势'),
                onPressed: () => Navigator.pushNamed(context, 'gesPage'),
              ),
              RaisedButton(
                child: Text('数据传递'),
                onPressed: () => Navigator.pushNamed(context, 'dataPage'),
              ),
              RaisedButton(
                child: Text('动画'),
                onPressed: () => Navigator.pushNamed(context, 'animationPage'),
              ),
              RaisedButton(
                child: Text('新闻'),
                onPressed: () => Navigator.pushNamed(context, 'newsPage'),
              ),
            ],
          )),
    );
  }
}
//
//class HomePage extends StatelessWidget {
//  HomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(this.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              onPressed: () {
//                Navigator.pop(context);
//              },
//              child: Text(
//                  '退出首页'
//              ),
//            ),
//            RaisedButton(
//              onPressed: () {
////                Navigator.of(context).pushNamed('mallPage', arguments: 'Hey');
////                Navigator.pushNamed(context, "mallPage");
//                Navigator.pushNamed(context, 'mallPage', arguments: 'Hey').then((msg)=>setSt)
//              },
//              child: Text(
//                  '进入商城'
//              ),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.pushNamed(context, "unknowPage");
//              },
//              child: Text(
//                  '进入错误页面'
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
