//
//  NKWeather.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKWeather.h"

@implementation NKWeather
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self modelEncodeWithCoder:aCoder];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self modelInitWithCoder:aDecoder];
}


//+ (instancetype)parseJson:(id)json {
//    [self modelWithJSON:json];
//    return ;
//}
@end
