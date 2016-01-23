//
//  NKDataManager.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKWeather.h"

@interface NKDataManager : NSObject
+ (instancetype)sharedManager;

/**
 *  获取所有城市的数据
 */
+ (__kindof NSMutableDictionary<NSString *, NKWeather *> *)getAllCityWeathers;
/**
 *  存储一个城市的数据
 */
+ (void)archiveWeather:(NKWeather *)weather withCity:(NSString *)cityName;
@end
