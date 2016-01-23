//
//  NKCurrentDayInfoView.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKCurrentDayInfoView.h"
#import "NKCurrentDayInfoFrame.h"

@implementation NKCurrentDayInfoView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - setUpUI
- (void)setUpUI {
    NKCurrentDayInfoFrame *frame = [[NKCurrentDayInfoFrame alloc] init];

    self.updateLabel = [[UILabel alloc] init];
    self.updateLabel.frame = frame.updateFrame;
    self.updateLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.updateLabel];

    self.aqiLabel = [[UILabel alloc] init];
    self.aqiLabel.frame = frame.aqiFrame;
    self.aqiLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:self.aqiLabel];

    self.tmpLabel = [[UILabel alloc] init];
    self.tmpLabel.frame = frame.tmpFrame;
    self.tmpLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.tmpLabel];

    self.condLabel = [[UILabel alloc] init];
    self.condLabel.frame = frame.condFrame;
    self.condLabel.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.condLabel];

    self.flLabel = [[UILabel alloc] init];
    self.flLabel.frame = frame.flFrame;
    self.flLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.flLabel];

    self.windLabel = [[UILabel alloc] init];
    self.windLabel.frame = frame.windFrame;
    self.windLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:self.windLabel];

    self.humLabel = [[UILabel alloc] init];
    self.humLabel.frame = frame.humFrame;
    self.humLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.humLabel];
    
    self.cellHeight = frame.cellHeight;
}


- (void)setWeather:(NKWeather *)weather {
    _weather = weather;
    self.updateLabel.text = weather.basic.update[@"loc"];

    self.tmpLabel.text = weather.now.tmp;

    self.condLabel.text = weather.now.cond[@"txt"];
    
}
@end
