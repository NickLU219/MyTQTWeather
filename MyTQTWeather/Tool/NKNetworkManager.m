//
//  NKNetworkManager.m
//  Demo01_AFnetworking
//
//  Created by 陆金龙 on 16/1/14.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKNetworkManager.h"
#import "AFNetworking.h"


@implementation NKNetworkManager
+ (void)GET:(NSString *)url parameters:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject[@"HeWeather data service 3.0"][0]);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];

}


@end
