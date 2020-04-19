//
//  SampleViewControl.m
//  Runner
//
//  Created by xiao fan on 2020/4/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "SampleViewControl.h"

@implementation SampleViewControl {
    UIView *_templcateView;
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    if (self = [super init]) {
        _templcateView = [[UIView alloc] init];
        _templcateView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (UIView *)view {
    return _templcateView;
}

@end
