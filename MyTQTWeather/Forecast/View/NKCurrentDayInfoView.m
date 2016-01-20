//
//  NKCurrentDayInfoView.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKCurrentDayInfoView.h"
#import "NKCurrentDayInfoFrame.h"
#import "NKCurrentDayInfo.h"

@implementation NKCurrentDayInfoView

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        [self setUpUI];

    }
    return self;
}

+ (instancetype)viewWithData:(id)data {
    return [[self alloc] initWithData:data];
}

#pragma mark - setUpUI
- (void)setUpUI {
    
}
@end
