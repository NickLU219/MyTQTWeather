//
//  NKTitleView.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKTitleView.h"

@implementation NKTitleView
- (instancetype)initWithTitle:(NSString *)titleStr {
    if (self = [super init]) {
        self.text = [NSString stringWithFormat:@"+ %@",titleStr];
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:20];
        [self sizeToFit];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
