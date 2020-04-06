import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
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
  bool isLoading = false; // 下拉刷新
  bool showMore = false; // 加载更多
  bool offState = false; // 进度条
  int page = 0; // 页码
  ScrollController _scrollController;


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
        isLoading = false;
        offState = true;
        showMore = false;
      });
      print("下拉刷新结束");
//      print("成功 ${newsList[0].title}");
    } catch (e) {
      print("失败 ${e}");
    }

  }

  _fetchMoreNews() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
      page++;
    });
    print('上拉加载更多 page = ${page}');

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
//        offState = true;
        isLoading = false;
        showMore = false;
      });
      print("上拉加载结束");
//      print("成功 ${newsList[0].title}");
    } catch (e) {
      print("失败 ${e}");
    }
  }

  Widget refreshItemWidget(BuildContext context, int position) {
//    print("positon ${position}");
    if (position < newsList.length) {
      var item = newsList[position];
      return Row(
        children: <Widget>[
          Padding(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: item.picUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 80,
                height: 80,
              ),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10), // 左上右下
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.title),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text('作者: ${item.authorName}', maxLines: 1,),
                      ),
                      Text('发布日期: ${item.date}')
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      );
    }

    if (showMore) {
      return Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('加载中...', style: TextStyle(fontSize: 16.0))
          ],
        ),
      );
    }

    return null;
//    return Container(
//      child: Center(
//        child: Text('暂无数据'),
//      ),
//    );

//    if (newsList.length == 0) {
//      return Center(
//        child: Text('暂无数据'),
//      );
//    }

//使用ListView.separated设置分割线

  }

  Future _onRefresh() async {
    print('下拉刷新 ${isLoading}');
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
      page = 0;
    });
    print("下拉刷新 page = ${page}");
    _fetchNewsList();
  }

  @override
  void initState() {
    // TODO: implement initState
    // 监听滚动
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print("滑动到了最底部 ${_scrollController.position.pixels}");
        setState(() {
          showMore = true;
        });
        _fetchMoreNews();
      }
    });
    super.initState();
    _fetchNewsList();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // 停止监听滚动
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//    final width = size.width;
//    final sHeight = size.height;
//    print(sHeight);
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: <Widget>[
            RefreshIndicator(
              child: ListView.separated(
                  controller: _scrollController,
                  itemBuilder: refreshItemWidget,
                  separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.green),
                  itemCount: newsList.length + 1),
              onRefresh: _onRefresh,
            ),
            Offstage(
              offstage: offState,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        )
    );
  }
}