import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdemo/MapView/NativeViewController.dart';

// 原生视图控制器
class MapView extends StatefulWidget {

  const MapView({
    Key key,
    this.controller,
  }): super(key: key);

  final NativeViewController controller;

  State<StatefulWidget> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'GLMapView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return UiKitView(
        viewType: 'GLMapView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
  }

  _onPlatformViewCreated(int id) {
    if (widget.controller == null) {
      return;
    }
    widget.controller.onCreate(id);
  }
}