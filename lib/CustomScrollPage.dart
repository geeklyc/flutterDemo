import 'package:flutter/material.dart';

class CustomScrollPage extends StatelessWidget {
//  ListPage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('CustomScrollView Demo'),
            floating: true,
            flexibleSpace: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584978988977&di=937b37cf6e4ff4d45beade1a23e607dc&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170712%2F20170712155220_e62f5c581ab45d41669aafb0045144ef_4.jpeg', fit: BoxFit.cover,),
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index'),), childCount: 100,
            ),
          )
        ],
      )
    );
  }
}