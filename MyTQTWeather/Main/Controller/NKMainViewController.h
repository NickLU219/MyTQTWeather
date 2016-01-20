//
//  NKMainViewController.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKMainViewController : UITabBarController
+ (void)getCnTitleAndEnTitle:(void(^)(NSArray<NSString *> *cnArray, NSArray<NSString *> *enArray))titleBlock;
@end
