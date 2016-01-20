//
//  UILabel+NKCreate.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (NKCreate)
/**
 *  create UILabel with title, font and size
 *
 *  @param title labelTitlt
 *  @param font  fontName  (Nullable)if nil default is systemFont
 *  @param size  fontSize
 *
 *  @return a UILabel
 */
+ (instancetype)labelWithTitle:(NSString * )title font:(NSString *)font size:(NSInteger)size;
@end
