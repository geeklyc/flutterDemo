//
//  GLMapView.swift
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Flutter
import Foundation

class GLMapView: NSObject, FlutterPlatformView {
    var frame: CGRect;
    var viewId: Int64 = 0;
    var messenger: FlutterBinaryMessenger!;
    var titleLabel: UILabel?;
    
    init(_ frame: CGRect, viewID: Int64, args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        self.frame = frame;
        self.viewId = viewID;
        self.messenger = binaryMessenger;
        
        super.init();
        
        self.initMethodChannel();
        
        let mapView = UILabel();
        mapView.backgroundColor = UIColor.green;
        mapView.text = "我是原生地图";
        mapView.textColor = UIColor.red;
        mapView.frame = frame;
        titleLabel = mapView;
    }
    
    // 初始化通道
    func initMethodChannel() {
        // 注册方法通道
        let mapChannel = FlutterMethodChannel.init(name: "geeklyc.flutter.io/glMap\(viewId)", binaryMessenger: messenger);
        // 原生端回调方法
        mapChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            
            guard let strongSelf = self else {
                return;
            }
            
            print("方法: \(call.method), 参数: \(call.arguments ?? "")");
            if (call.method == "startLocation") {
                
                strongSelf.startLocation(callback: result);
//                result([ "longitude": 114, "latitude": 22, "city": "深圳"]);
            } else if (call.method == "stopLocation") {
                
                strongSelf.stopLocation(callback: result);
//                result(0);
            } else if (call.method == "changeBackgroundColor") {
                strongSelf.titleLabel?.backgroundColor = UIColor.blue;
                result(0);
            }
            else {
                result(FlutterMethodNotImplemented);
            }
            
            
        }
    }
    
    // 开始定位
    func startLocation(callback: @escaping FlutterResult) {
        
//        AlertHelper.showAlert(title: "调用原生方法打开", message: "开始定位");
        print("开始定位") ;
        
//        print(titleLabel);
//        titleLabel?.text = "我是原生地图，接收到参数";
        delay(by: 2) {
            callback([ "longitude": 114, "latitude": 22, "city": "深圳"]);
        };
    }
    
    // 停止定位
    func stopLocation(callback: @escaping FlutterResult) {
        callback(nil);
//        AlertHelper.showAlert(title: "调用原生方法打开", message: "停止定位");
    }
    
    // 地图
    func view() -> UIView {
        return titleLabel!;
    }
    
}
