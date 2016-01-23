//
//  NKDataManager.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKDataManager.h"

static NKDataManager *_sharedManager = nil;
@implementation NKDataManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self new];
    });
    return _sharedManager;
}

static NSMutableDictionary<NSString *, NKWeather *> *_allCityWeathers = nil;
+ (NSMutableDictionary<NSString *,NKWeather *> *)getAllCityWeathers {
    if (!_allCityWeathers) {
        _allCityWeathers = [NSMutableDictionary dictionary];
    }
    return _allCityWeathers;
}

+ (void)archiveWeather:(NKWeather *)weather withCity:(NSString *)cityName {
//    _allCityWeathers[cityName] = weather;
    if (!_allCityWeathers) {
        _allCityWeathers = [NSMutableDictionary dictionary];
    }
    [_allCityWeathers setValue:weather forKey:cityName];
//    [_allCityWeathers setValue:weather forUndefinedKey:cityName];
//    [_allCityWeathers addEntriesFromDictionary:@{cityName: weather}];
}





@end
