//
//  AlertHelp.swift
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

class AlertHelper {
    
    /// 弹框
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    static func showAlert(title: String, message: String) {
        let window = UIApplication.shared.keyWindow;
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "取消", style: .cancel) { (action) in
            
        }
        alert.addAction(action);
        window?.rootViewController?.present(alert, animated: true, completion: nil);
    }
}
