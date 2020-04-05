import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'NewsItem.dart';
import 'dart:convert';

class SignleNewsPage extends StatefulWidget {
  SignleNewsPage({Key key, this.item}) : super(key: key);
  // 条目
  final Map<String, String> item;

  State<StatefulWidget> createState() => _SignleNewsPage(item: item);
}

class _SignleNewsPage extends State<SignleNewsPage> {

  _SignleNewsPage({Key key, this.item});
  final Map<String, String> item;

  List newsList = [];

  _fetchNewsList() async {
    Dio dio = Dio();
    var urlStr = 'http://v.juhe.cn/toutiao/index?key=5b4d54e80de8d532805bfc91d4c1e4c3&type=${item['key']}';
    print(urlStr);
    try {
      Response response = await dio.get(urlStr);
      final jsonResponse = json.decode(response.toString());
      final List originList = jsonResponse['result']['data'];
      var dataSource = [];
      originList.forEach((item) {
        dataSource.add(NewsItem.fromJson(item));
      });
      this.setState(() {
        newsList = dataSource;
      });
//      print("成功 ${newsList[0].title}");
    } catch (e) {
      print("失败 ${e}");
    }

  }

  renderListView() {
    if (newsList.length == 0) {
      return Center(
        child: Text('暂无数据'),
      );
    }

//使用ListView.separated设置分割线
    return Expanded(
      child: ListView.separated(
          itemCount: newsList.length,
          separatorBuilder: (BuildContext context, int index) => index %2 == 0? Divider(color: Colors.green) : Divider(color: Colors.red),//index为偶数，创建绿色分割线；index为奇数，则创建红色分割线
          itemBuilder: (BuildContext context, int index) {
            var item = newsList[index];
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text(item.title),
                )
              ],
            );
            return Text('测试');
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//    final width = size.width;
//    final sHeight = size.height;
//    print(sHeight);
    // TODO: implement build
    return Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: FlatButton(
                onPressed: _fetchNewsList,
                child: Text('加载'),
              ),
            ),
            renderListView(),
          ],
        )
    );
  }
}