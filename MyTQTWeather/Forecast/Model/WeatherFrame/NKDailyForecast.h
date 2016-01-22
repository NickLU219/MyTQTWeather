//
//  NKDailyForecast.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKDailyForecast : NSObject
/**  date	当地日期 */
@property (nonatomic, strong) NSDate *date;
/**  astro	天文数值 
 *   sr	日出时间
 *   ss	日落时间
 */
@property (nonatomic, strong) NSDictionary *astro;
/**  tmp	温度
 *   max	最该温度(摄氏度)
 *   min	最低温度(摄氏度)
 */
@property (nonatomic, strong) NSDictionary *tmp;
/**  wind	风力状况
 *   spd	风速(Kmph)
 *   sc	风力等级
 *   deg	风向(角度)
 *   dir	风向(方向)  
 */
@property (nonatomic, strong) NSDictionary *wind;
/**  cond	天气状况
 *   code_d	白天天气代码
 *   txt_d	白天天气描述
 *   code_n	夜间天气代码
 *   txt_n	夜间天气描述 
 */
@property (nonatomic, strong) NSDictionary *cond;
/**  pcpn	降雨量(mm) */
@property (nonatomic, strong) NSString *pcpn;
/**  pop  降水概率 */
@property (nonatomic, strong) NSString *pop;
/**  hum	湿度(%) */
@property (nonatomic, strong) NSString *hum;
/**  pres	气压 */
@property (nonatomic, strong) NSString *pres;
/**  vis	能见度(km) */
@property (nonatomic, strong) NSString *vis;

@end
