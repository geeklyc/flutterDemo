import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterdemo/MapView/MapView.dart';
//import 'dart:async';
//import 'dart:io';
//import 'dart:convert';
// 包含方法渠道
import 'package:flutter/services.dart';
import 'package:flutterdemo/MapView/NativeViewController.dart';

class MapPage extends StatefulWidget {
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
//  MapPage({Key key, this.title}) : super(key: key);
//  final String title;
  Map<String, dynamic> locInfo;
  NativeViewController controller;
  List widgets = [ 'startLocation', 'stopLocation' ];



  // 配置方法通道
//  final platform = MethodChannel('geeklyc.flutter.io/glMap');

  // 开始定位
  startLocation() async {
    dynamic result;
    try {
      result = await controller.startLocation();
    } catch(e) {
      result = -1;
    }

    setState(() {
      locInfo = new Map<String, dynamic>.from(result);
    });
    print("Result: $result");
  }

  // 停止定位
  stopLocation() async {
    dynamic result;
    try {
      result = await controller.stopLocation();
    } catch(e) {
      result = -1;
    }

    if (result == null) {
      setState(() {
        locInfo = null;
      });
    }
    print("Result: $result");
  }

  @override
  void initState() {
    controller = NativeViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('调用原生地图'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton(
                    onPressed: () => startLocation(),
                    child: Text('开始定位'),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: locInfo != null ? Text('经度：${locInfo['longitude']}, 纬度: ${locInfo['latitude']}, 城市: ${locInfo['city']}', maxLines: 2,) : Text('请点击定位'),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton(
                    onPressed: () => stopLocation(),
                    child: Text('停止定位'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 40,
                child: FloatingActionButton(
                  child: Icon(Icons.change_history),
                  onPressed: () => controller.changeBackgroundColor(),
                ),
              )
            ],
          ),
          Expanded(
            child: MapView(controller: controller),
          )
        ],
      ),
    );
  }
}
//geeklyc.flutter.io/glMap