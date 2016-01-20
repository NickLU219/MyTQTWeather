//
//  NKTabBarButtonView.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKTabBarButtonView : UIButton
/**
 *  create UIButton with cnTitle and enTitle
 *
 *  @param cnTitle cnTitle
 *  @param enTitle enTitle
 *
 *  @return a UIButton
 */
+ (instancetype)buttonWithFrame:(CGRect)frame cnTitle:(NSString *)cnTitle andEnTitle:(NSString *)enTitle;

@end
