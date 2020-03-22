import 'package:flutter/material.dart';

class MallPage extends StatelessWidget {
  MallPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    String msg  = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
//                Navigator.pop(context);
              // 传递参数给上一个页面
                Navigator.pop(context, 'Hi');
              },
              child: Text(
                  '退出商城'
              ),
            ),
            Text(
                '上个页面传来的参数：${msg}'
            ),
          ],
        ),
      ),
    );
  }
}