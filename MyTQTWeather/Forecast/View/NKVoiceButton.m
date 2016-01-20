//
//  NKVoiceButton.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKVoiceButton.h"

@implementation NKVoiceButton

- (instancetype)init {
    if (self = [super init]) {
        [self setImage:[UIImage imageNamed:@"forecast_navigationbar_icon_voice_normal"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"forecast_navigationbar_icon_voice_hilight"] forState:UIControlStateHighlighted];
        [self sizeToFit];
    }
    return self;
}

@end
