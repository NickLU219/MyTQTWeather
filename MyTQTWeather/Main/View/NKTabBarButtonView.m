//
//  NKTabBarButtonView.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKTabBarButtonView.h"

@implementation NKTabBarButtonView {
    /**
     *  cnTitle
     */
    NSString *_cnTitlt;
    /**
     *  enTitle
     */
    NSString *_enTitle;
    /**
     *  cnLabel
     */
    UILabel *_cnLabel;
    /**
     *  enLabel
     */
    UILabel *_enLabel;

}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame cnTitle:(NSString *)cnTitle andEnTitle:(NSString *)enTitle {
    if (self = [super init]) {

        _cnTitlt = cnTitle;
        _enTitle = enTitle;

        _cnLabel.adjustsFontSizeToFitWidth = NO;
        _cnLabel = [UILabel labelWithTitle:cnTitle font:nil size:18];
        _cnLabel.textAlignment = NSTextAlignmentCenter;

        _enLabel.adjustsFontSizeToFitWidth = NO;
        _enLabel = [UILabel labelWithTitle:enTitle font:@"AppleColorEmoji" size:10];
        _enLabel.textAlignment = NSTextAlignmentCenter;
        self.selected = NO;


        _cnLabel.frame = CGRectMake(0, frame.size.height * 0.2, frame.size.width, frame.size.height * 0.4);
        _enLabel.frame = CGRectMake(0, CGRectGetMaxY(_cnLabel.frame), frame.size.width, frame.size.height * 0.3);

        [self addSubview:_cnLabel];
        [self addSubview:_enLabel];
    }
    return self;
}


+ (instancetype)buttonWithFrame:(CGRect)frame cnTitle:(NSString *)cnTitle andEnTitle:(NSString *)enTitle {
    
    return [[self alloc] initWithFrame:(CGRect)frame cnTitle:cnTitle andEnTitle:enTitle];

}

#pragma mark - setSelected
- (void)setSelected:(BOOL)selected {
    if (!selected) {
        _cnLabel.textColor = [UIColor grayColor];
        _enLabel.textColor = [UIColor grayColor];
    } else {
        _cnLabel.textColor = [UIColor whiteColor];
        _enLabel.textColor = [UIColor whiteColor];
    }
}

@end
