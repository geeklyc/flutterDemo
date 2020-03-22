import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
//  ListPage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: 100,
//        itemExtent: 50.0,
        separatorBuilder: (BuildContext context, int index) => index % 2 == 0 ? Divider(color: Colors.green,) : Divider(color: Colors.red,),
        itemBuilder: (BuildContext context, int index) => ListTile(title: Text('title $index'), subtitle: Text('body $index'),),
      ),
//      body: ListView(
//        scrollDirection: Axis.horizontal,
//        itemExtent: 140,
//        children: <Widget>[
//          Container(color: Colors.black,),
//          Container(color: Colors.red,),
//          Container(color: Colors.blue,),
//          Container(color: Colors.green,),
//          Container(color: Colors.yellow,),
//          Container(color: Colors.orange,)
//        ],
//      ),
//      body: ListView(
//        children: <Widget>[
//          ListTile(leading: Icon(Icons.map), title: Text('Map'),),
//          ListTile(leading: Icon(Icons.mail), title: Text('Mail'),),
//          ListTile(leading: Icon(Icons.message), title: Text('Message'),)
//        ],
//      ),
    );
  }
}