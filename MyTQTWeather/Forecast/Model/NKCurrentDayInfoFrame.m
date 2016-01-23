//
//  NKCurrentDayInfoFrame.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKCurrentDayInfoFrame.h"

@implementation NKCurrentDayInfoFrame

- (instancetype)init {
    if (self = [super init]) {
        [self calculatingFrame];
    }
    return self;
}

- (void)calculatingFrame {
    //update
    self.updateFrame = CGRectMake(10, 0, SCREEN_BOUNDS_WIDTH, 20);

    //tmp
    self.tmpFrame = CGRectMake(10, 200, 64, 128);

    //cond
    self.condFrame = CGRectMake(CGRectGetMaxX(self.tmpFrame), CGRectGetMinY(self.tmpFrame), 64, 128);

    //fl
    self.flFrame = CGRectMake(CGRectGetMinX(self.tmpFrame), CGRectGetMaxY(self.tmpFrame) + 5, 100, 30);

    //wind
    self.windFrame = CGRectMake(CGRectGetMinX(self.flFrame), CGRectGetMaxY(self.flFrame), 100, 30);

    //hum
    self.humFrame = CGRectMake(CGRectGetMaxX(self.flFrame), CGRectGetMinY(self.windFrame), 100, 30);

    //cellHeight
    self.cellHeight = CGRectGetMaxY(self.windFrame);
}
@end
