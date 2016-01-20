//
//  NKCurrentDayInfoFrame.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKCurrentDayInfoFrame : NSObject
/**
 *  updateTimeFrame
 */
@property (nonatomic) CGRect updateFrame;
/**
 *  aqiFrame
 */
@property (nonatomic) CGRect aqiFrame;
/**
 *  tmperatureFrame
 */
@property (nonatomic) CGRect tmpFrame;
/**
 *  condFrame
 */
@property (nonatomic) CGRect condFrame;
/**
 *  bodyFeelFrame
 */
@property (nonatomic) CGRect flFrame;
/**
 *  winDrectionFrame
 */
@property (nonatomic) CGRect windFrame;
/**
 *  wetFrame
 */
@property (nonatomic) CGRect humFrame;

/**
 *  cellHeight
 */
@property (nonatomic) CGFloat cellHeight;
@end
