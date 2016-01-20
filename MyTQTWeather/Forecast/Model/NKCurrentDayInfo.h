//
//  NKCurrentDayInfo.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/20.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKCurrentDayInfo : NSObject 
/**
 *  updateTime
 */
@property (nonatomic, copy) NSString *update;
/**
 *  aqiNum
 */
@property (nonatomic, copy) NSString *aqi;
/**
 *  qlty
 */
@property (nonatomic, copy) NSString *qlty;
/**
 *  tmperature
 */
@property (nonatomic, copy) NSString *tmp;
/**
 *  condCode (icon)
 */
@property (nonatomic, copy) NSString *condCode;
/**
 *  cond (txt)
 */
@property (nonatomic, copy) NSString *condtxt;
/**
 *  bodyFeel
 */
@property (nonatomic, copy) NSString *fl;
/**
 *  windDrection(e.g.东北)
 */
@property (nonatomic, copy) NSString *windDir;
/**
 *  windStrength
 */
@property (nonatomic, copy) NSString *windSc;
/**
 *  wet
 */
@property (nonatomic, copy) NSString *hum;

/**
 *  parseDataToCreate
 */
+ (instancetype)parseDataToCreate:(id)res;
@end
