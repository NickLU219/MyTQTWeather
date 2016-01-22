//
//  NKHourlyForecast.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKHourlyForecast : NSObject
/**  date	当地日期和时间 */
@property (nonatomic, strong) NSDate *date;
/**  tmp	当前温度(摄氏度) */
@property (nonatomic, strong) NSString *tmp;
/**  wind	风力状况
  *  spd	风速(Kmph)
  *  sc	    风力等级
  *  deg	风向(角度)
  *  dir	风向(方向) 
  */
@property (nonatomic, strong) NSDictionary *wind;
/**  pop   降水概率 */
@property (nonatomic, strong) NSString *pop;
/**  hum	湿度(%) */
@property (nonatomic, strong) NSString *hum;
/**  pres	气压 */
@property (nonatomic, strong) NSString *pres;

@end
