//
//  GLMapFactory.swift
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Flutter

class GLMapFactory: NSObject, FlutterPlatformViewFactory {
    
    var messenger: FlutterBinaryMessenger!
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return GLMapView(frame, viewID: viewId, args: args, binaryMessenger: messenger);
    }
    
    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init();
        self.messenger = messenger;
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance();
    }
}
