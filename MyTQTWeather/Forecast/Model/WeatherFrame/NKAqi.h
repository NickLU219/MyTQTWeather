//
//  NKAqi.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKCity.h"

@interface NKAqi : NSObject <NSCoding>
/**
 *  city
 */
@property (nonatomic, strong) NKCity *city;

@end
