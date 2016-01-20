//
//  NKLocationManager.h
//  WeatherForecast
//
//  Created by 陆金龙 on 16/1/18.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKLocationManager : NSObject
+ (instancetype)sharedLocationManager;

+ (void)getUserLocation:(void(^)(double lat, double lon, NSString *locName))location;

@end
