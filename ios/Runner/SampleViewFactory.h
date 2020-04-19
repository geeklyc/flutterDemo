//
//  SampleViewFactory.h
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneratedPluginRegistrant.h"

NS_ASSUME_NONNULL_BEGIN

@interface SampleViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessender:(NSObject<FlutterBinaryMessenger> *)messager;

@end

NS_ASSUME_NONNULL_END
