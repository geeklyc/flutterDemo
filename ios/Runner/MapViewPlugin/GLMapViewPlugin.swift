//
//  GLMapViewPlugin.swift
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Flutter

class GLMapViewPlugin {
    static func registerWith(register: FlutterPluginRegistry) {
        let pluginKey = "GL_MapView_Plugin";
        // 插件是否注册过
        if (register.hasPlugin(pluginKey)) {
            return;
        }
        
        // 注册插件
        let newRegister = register.registrar(forPlugin: pluginKey);
        let messenger = newRegister.messenger() as! (NSObject & FlutterBinaryMessenger);
        newRegister.register(GLMapFactory(messenger: messenger), withId: "GLMapView");
    }
}
