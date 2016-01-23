//
//  NKCurrentDayInfoView.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKWeather.h"

@interface NKCurrentDayInfoView : UIView


/**  cellHeight */
@property (nonatomic) CGFloat cellHeight;

/**
 *  updateTimeLabel
 */
@property (nonatomic, strong) UILabel *updateLabel;
/**
 *  aqiLabel
 */
@property (nonatomic, strong) UILabel *aqiLabel;
/**
 *  tmperatureLabel
 */
@property (nonatomic, strong) UILabel *tmpLabel;
/**
 *  condLabel
 */
@property (nonatomic, strong) UILabel *condLabel;
/**
 *  bodyFeelLabel
 */
@property (nonatomic, strong) UILabel *flLabel;
/**
 *  winDrectionLabel
 */
@property (nonatomic, strong) UILabel *windLabel;
/**
 *  wetLabel
 */
@property (nonatomic, strong) UILabel *humLabel;

/**  weatherData */
@property (nonatomic, strong) NKWeather *weather;
@end
