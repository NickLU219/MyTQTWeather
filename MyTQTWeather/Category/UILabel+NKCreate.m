//
//  UILabel+NKCreate.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "UILabel+NKCreate.h"

@implementation UILabel (NKCreate)
- (instancetype)initWithTitle:(NSString *)title font:(nullable NSString *)font size:(NSInteger)size {
    if (self = [super init]) {
        self.text = title;
        if (font) {
            [self setFont:[UIFont fontWithName:font size:size]];
        } else {
            [self setFont:[UIFont systemFontOfSize:size]];
        }
    }
    return self;
}

+ (instancetype)labelWithTitle:(NSString *)title font:(nullable NSString *)font size:(NSInteger)size {
    return [[UILabel alloc] initWithTitle:title font:font size:size];
}
@end
