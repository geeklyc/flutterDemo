import 'package:flutter/services.dart';

class NativeViewController {
  MethodChannel _channel;

  onCreate(int id) {
    _channel = MethodChannel('geeklyc.flutter.io/glMap$id');
  }

  Future<void> changeBackgroundColor() async {
    return _channel.invokeMethod('changeBackgroundColor');
  }

  Future<dynamic> startLocation() async {
    return _channel.invokeMethod('startLocation');
//    dynamic result;
//    try {
//      result = await platform.invokeMethod('startLocation', <String, dynamic> {
//        'title': '地图标题',
//      });
//    } catch(e) {
//      result = -1;
//    }
  }

  Future<dynamic> stopLocation() async {
    return _channel.invokeMethod('stopLocation');
  }
}