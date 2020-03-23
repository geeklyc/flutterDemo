import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('ScrollNotifaction'),),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            print("滚动开始");
          } else if (scrollNotification is ScrollEndNotification) {
            print("滚动结束");
          } else if (scrollNotification is ScrollUpdateNotification) {
            print("滚动更新 ${scrollNotification.metrics.pixels}");
          }
        },
        child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(title: Text('Index: $index'),)),
      ),
    );
  }
}

//class ListPage extends StatefulWidget {
//  State<StatefulWidget> createState() => _ListPage();
//}
//
//class _ListPage extends State<ListPage> {
//  ScrollController _controller;
//  bool isToTop = false;
//
//  @override
//  void initState() {
//    // 创建并监听
//    _controller = ScrollController();
//    _controller.addListener(() {
//      if (_controller.offset > 400) {
//        setState(() {
//          isToTop = true;
//        });
//      } else if (_controller.offset < 100) {
//        setState(() {
//          isToTop = false;
//        });
//      }
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(title: Text("Scoll Controller Widget"),),
//      body: Column(
//        children: <Widget>[
//          Container(
//            height: 40,
//            child: RaisedButton(
//              onPressed: (isToTop ? (){
//                if (isToTop) {
//                  _controller.animateTo(.0,
//                      duration: Duration(milliseconds: 200),
//                      curve: Curves.ease);
//                }
//              } : null),
//              child: Text('Top'),
//            ),
//          ),
//          Expanded(
//            child: ListView.builder(
//              controller: _controller,
//              itemCount: 100,
//              itemBuilder: (context, index) => ListTile(title: Text('Index: $index'),),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    // 销毁
//    _controller.dispose();
//    super.dispose();
//  }
//}