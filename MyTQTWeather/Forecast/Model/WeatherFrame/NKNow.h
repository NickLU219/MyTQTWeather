//
//  NKNow.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKNow : NSObject
/**  tmp	当前温度(摄氏度) */
@property (nonatomic, strong) NSString *tmp;
/**  fl	体感温度 */
@property (nonatomic, strong) NSString *fl;
/**  wind	风力状况
 *  spd	风速(Kmph)
 *  sc	    风力等级
 *  deg	风向(角度)
 *  dir	风向(方向)
 */
@property (nonatomic, strong) NSDictionary *wind;
/**  cond	天气状况
  *  code	天气代码
  *  txt	天气描述 
 */
@property (nonatomic, strong) NSDictionary *cond;
/**  pcpn	降雨量(mm) */
@property (nonatomic, strong) NSString *pcpn;
/**  hum	湿度(%) */
@property (nonatomic, strong) NSString *hum;
/**  pres	气压 */
@property (nonatomic, strong) NSString *pres;
/**  vis	能见度(km) */
@property (nonatomic, strong) NSString *vis;


@end
