//
//  NKCity.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKCity : NSObject
/**  aqi	空气质量指数 */
@property (nonatomic, strong) NSString *aqi;
/**  pm25	PM2.5 1小时平均值(ug/m³) */
@property (nonatomic, strong) NSString *pm25;
/**  pm10	PM10 1小时平均值(ug/m³) */
@property (nonatomic, strong) NSString *pm10;
/**  so2	二氧化硫1小时平均值(ug/m³)  */
@property (nonatomic, strong) NSString *so2;
/**  no2	二氧化氮1小时平均值(ug/m³) */
@property (nonatomic, strong) NSString *no2;
/**  co	一氧化碳1小时平均值(ug/m³) */
@property (nonatomic, strong) NSString *co;
/**  o3	臭氧1小时平均值(ug/m³) */
@property (nonatomic, strong) NSString *o3;
/**  qlty	空气质量类别 */
@property (nonatomic, strong) NSString *qlty;

@end
