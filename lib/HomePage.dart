import 'package:flutter/material.dart';
import 'package:flutterdemo/MallPage.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('新首页'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
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
