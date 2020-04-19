//
//  SampleViewControl.h
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneratedPluginRegistrant.h"

NS_ASSUME_NONNULL_BEGIN

@interface SampleViewControl : NSObject<FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger;

@end

NS_ASSUME_NONNULL_END
