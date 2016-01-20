//
//  NSDate+NKCompare.h
//  MyWeatherDemo
//
//  Created by 陆金龙 on 16/1/2.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NKCompare)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

//+ (NSString *)weekdayStringFromDate:(NSDate *)inputDate;

+ (NSString *)weekDayFromDate:(NSString *)date;

+ (NSString *)monthDateFromDate:(NSString *)date;
/**
 *  判断是否白天
 *
 *  @return 返回bool值，yes为白天，no为晚上
 */
+ (BOOL)isDayTime;

@end
