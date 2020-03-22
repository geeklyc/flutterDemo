import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
//  UnknownPage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '错误集中处理页面'
            )
          ],
        ),
      ),
    );
  }
}