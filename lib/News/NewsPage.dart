import 'package:flutter/material.dart';
import 'package:flutterdemo/News/SignleNewsPage.dart';

class NewsPage extends StatefulWidget {
  State<StatefulWidget> createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  var tabInfos = [
    {
      'title': '头条',
      'key': 'top',
    },
    {
      'title': '社会',
      'key': 'shehui',
    },
    {
      'title': '国内',
      'key': 'guonei',
    },
    {
      'title': '国际',
      'key': 'guoji',
    },
    {
      'title': '娱乐',
      'key': 'yule',
    },
//    {
//      'title': '体育',
//      'key': 'tiyu',
//    },
//    {
//      'title': '军事',
//      'key': 'junshi',
//    },
//    {
//      'title': '科技',
//      'key': 'keji',
//    },
//    {
//      'title': '财经',
//      'key': 'caijing',
//    },
//    {
//      'title': '时尚',
//      'key': 'shishang',
//    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: tabInfos.length, vsync: this);
  }

  // 创建tab
  createTabs() {
    var tabs = new List<Widget>();
    tabInfos.forEach((item) {
      tabs.add(Tab(icon: Icon(Icons.cake), text: item['title']));
    });
    return tabs;
  }

  createTabPages() {
    var tabPages = new List<Widget>();
    tabInfos.forEach((item) {
      tabPages.add(SignleNewsPage(item: item));
    });
    return tabPages;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻'),
        bottom: TabBar(
          tabs: createTabs(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: createTabPages(),
      ),
    );
  }
}