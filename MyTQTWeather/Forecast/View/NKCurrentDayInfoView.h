//
//  NKCurrentDayInfoView.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKCurrentDayInfoView : UIView
/**
 *  create with some (id)data
 *
 *  @param data (id)data
 *
 *  @return a currentDayInfoView
 */
+ (instancetype)viewWithData:(id)data;


/**
 *  updateTimeLabel
 */
@property (nonatomic, weak) UILabel *updateLabel;
/**
 *  aqiLabel
 */
@property (nonatomic, weak) UILabel *aqiLabel;
/**
 *  tmperatureLabel
 */
@property (nonatomic, weak) UILabel *tmpLabel;
/**
 *  condLabel
 */
@property (nonatomic, weak) UILabel *condLabel;
/**
 *  bodyFeelLabel
 */
@property (nonatomic, weak) UILabel *flLabel;
/**
 *  winDrectionLabel
 */
@property (nonatomic, weak) UILabel *windLabel;
/**
 *  wetLabel
 */
@property (nonatomic, weak) UILabel *humLabel;
@end
