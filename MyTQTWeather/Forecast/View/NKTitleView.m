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
        [self setTitle:[NSString stringWithFormat:@"+ %@",titleStr] forState:UIControlStateNormal] ;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        [self sizeToFit];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
