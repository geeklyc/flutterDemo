import 'package:flutter/material.dart';
import 'dart:math';

class UpdatedItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;
  UpdatedItemModel({this.appIcon, this.appName, this.appSize, this.appDate, this.appDescription, this.appVersion});

}

class UpdatedItemWidget extends StatelessWidget {
  final UpdatedItemModel model;
  UpdatedItemWidget({Key key,this.model, this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //组合上下两部分
    return Column(
        children: <Widget>[
          buildTopRow(context),
          buildBottomRow(context)
        ]);
  }

  //创建上半部分
  Widget buildTopRow(BuildContext context) {
    return Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(model.appIcon, width: 80,height:80)
              )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.appName,maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, color: Color(0xFF8E8D92)),),
                Text("${model.appDate}",maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,10,0),
            child: FlatButton(
              color: Color(0xFFF1F0F7),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              child: Text("OPEN", style: TextStyle(color:Color(0xFF007AFE),fontWeight: FontWeight.bold),),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: onPressed,
            ),
          )
        ]);

  }
  //创建下半部分
  Widget buildBottomRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15,0,15,0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.appDescription),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,0),
                  child: Text("${model.appVersion} • ${model.appSize} MB")
              )
            ]
        )
    );
  }
}

// 饼图

class WheelPainter extends CustomPainter {
  // 设置画笔颜色
  Paint getColoredPaint(Color color) {//根据颜色返回不同的画笔
    Paint paint = Paint();//生成画笔
    paint.color = color;//设置画笔颜色
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {//绘制逻辑
    double wheelSize = min(size.width,size.height)/2;//饼图的尺寸
    double nbElem = 6;//分成6份
    double radius = (2 * pi) / nbElem;//1/6圆
    //包裹饼图这个圆形的矩形框
    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize, wheelSize), radius: wheelSize);
    // 每次画1/6个圆弧
    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }
  // 判断是否需要重绘，这里我们简单的做下比较即可
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

//将饼图包装成一个新的控件
class Cake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(),
    );
  }
}

class CombinationPage extends StatefulWidget {
  CombinationPage({Key key, this.title}) : super(key: key);
  final String title;

  State<StatefulWidget> createState() => _CombinationPage();
}

class _CombinationPage extends State<CombinationPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onPressed() {
      print("点击按钮");
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.system_update), text: '组合',),
              Tab(icon: Icon(Icons.cake), text: '自绘'),
            ],
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView(
              children: <Widget>[
                UpdatedItemWidget(model: UpdatedItemModel(
                    appIcon: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585154441711&di=595db7d1d0ae9f89077038613f2c41a0&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20180802%2F03%2F1533152912-BmPIzdDxuT.jpg',
                    appDescription:"Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                    appName: "Google Maps - Transit & Fond",
                    appSize: "137.2",
                    appVersion: "Version 5.19",
                    appDate: "2019年6月5日"
                ), onPressed: _onPressed,)
              ],
            ),
            Center(
              child: Cake(),
            )
          ],
        )
    );
  }
}
