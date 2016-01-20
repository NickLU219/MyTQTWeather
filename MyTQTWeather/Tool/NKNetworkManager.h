//
//  NKNetworkManager.h
//  Demo01_AFnetworking
//
//  Created by 陆金龙 on 16/1/14.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKNetworkManager : NSObject

+ (void)GET:(NSString *)url parameters:(NSDictionary *)params success:(void(^)(id reponseObject))success failure:(void(^)(NSError *error))failure;

@end
