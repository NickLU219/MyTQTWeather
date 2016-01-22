//
//  NKSuggestion.h
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/22.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKSuggestion : NSObject
/**  drsg	穿衣指数
  *  brf	简介
  *  txt	详情 
 */
@property (nonatomic, strong) NSDictionary *drsg;
/**  uv	    紫外线指数
  *  brf	简介
  *  txt	详情 
 */
@property (nonatomic, strong) NSDictionary *uv;
/**  cw	洗车指数
  *  brf	简介
  *  txt	详情
 */
@property (nonatomic, strong) NSDictionary *cw;
/**  trav	旅游指数
  *  brf	简介
  *  txt	详情 
 */
@property (nonatomic, strong) NSDictionary *trav;
/**  flu	感冒指数
  *  brf	简介
  *  txt	详情 
 */
@property (nonatomic, strong) NSDictionary *flu;
/**  sport	运动指数
  *  brf	简介
  *  txt	详情 
 */
@property (nonatomic, strong) NSDictionary *sport;
@end
