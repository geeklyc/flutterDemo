//
//  Common.swift
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,
              _ closure: @escaping () -> Void) {
    let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main;
    dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure);
}
