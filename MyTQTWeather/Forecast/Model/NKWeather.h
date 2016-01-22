//
//  NKWeather.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKAqi.h"
#import "NKBasic.h"
#import "NKDailyForecast.h"
#import "NKHourlyForecast.h"
#import "NKNow.h"
#import "NKSuggestion.h"

@interface NKWeather : NSObject <NSCoding>
/**  Aqi 空气质量指数 */
@property (nonatomic, strong) NKAqi *aqi;
/**  Basic */
@property (nonatomic, strong) NKBasic *basic;
/**  DailyWeatherArray */
@property (nonatomic, strong) NSArray<NKDailyForecast *> *daily_forecast;
/**  HourlyWeatherArray */
@property (nonatomic, strong) NSArray<NKHourlyForecast *> *hourly_forecast;
/**  Now */
@property (nonatomic, strong) NKNow *now;
/**  status */
@property (nonatomic, strong) NSString *status;
/**  Suggestion */
@property (nonatomic, strong) NKSuggestion *suggestion;

//+ (instancetype)parseJson:(id)json;
@end
