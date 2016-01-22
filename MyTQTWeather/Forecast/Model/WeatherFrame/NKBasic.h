//
//  NKBasic.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKBasic : NSObject
/**  city	城市名称 */
@property (nonatomic, strong) NSString *city;
/**  id	城市ID */
@property (nonatomic, strong) NSString *cityID;
/**  cnty	国家名称 */
@property (nonatomic, strong) NSString *cnty;
/**  lat	纬度 */
@property (nonatomic, strong) NSString *lat;
/**  lon	经度 */
@property (nonatomic, strong) NSString *lon;
/**  update	数据更新时间,24小时制 
  *  loc	数据更新的当地时间
  *  utc	数据更新的UTC时间
 */
@property (nonatomic, strong) NSDictionary *update;

@end
