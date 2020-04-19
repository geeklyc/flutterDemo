//
//  SampleViewFactory.m
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "SampleViewFactory.h"
#import "SampleViewControl.h"

@implementation SampleViewFactory {
    NSObject<FlutterBinaryMessenger> *_messenger;
}

- (instancetype)initWithMessender:(NSObject<FlutterBinaryMessenger> *)messager {
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

- (NSObject<FlutterMessageCodec> *)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    SampleViewControl *activity = [[SampleViewControl alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return activity;
}

@end
