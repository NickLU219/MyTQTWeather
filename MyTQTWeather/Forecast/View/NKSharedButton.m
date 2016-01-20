//
//  NKSharedButton.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKSharedButton.h"

@implementation NKSharedButton

- (instancetype)init {
    if (self = [super init]) {
        [self setImage:[UIImage imageNamed:@"share_white"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"share_white_hilight"] forState:UIControlStateHighlighted];
        [self sizeToFit];
    }
    return self;
}

@end
