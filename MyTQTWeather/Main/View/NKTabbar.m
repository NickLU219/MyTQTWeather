//
//  NKTabbar.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKTabbar.h"
#import "NKMainViewController.h"
#import "NKTabBarButtonView.h"


#pragma mark - some constant
#define buttonW  SCREEN_BOUNDS_WIDTH / 4
#define buttonH  49
@implementation NKTabbar {
    /**
     *  backgroundImage of selectedButton
     */
    UIImageView *_selectedView;
    NKTabBarButtonView *_selectedButton;
}
#pragma mark - Main
/**
 *  rewrite the init method
 *
 *  @return a tabbar
 */
- (instancetype)init {
    if (self = [super init]) {
        
        self.backgroundImage = [UIImage imageNamed:@"tabbar"];

        //add button
        [NKMainViewController getCnTitleAndEnTitle:^(NSArray<NSString *> *cnArray, NSArray<NSString *> *enArray) {
            for (NSInteger index = 0; index < cnArray.count; index++) {
                //calculate the frame

                CGRect frame = CGRectMake(0, 0, buttonW, buttonH);
                //create buttons
                NKTabBarButtonView *btn = [NKTabBarButtonView buttonWithFrame:frame cnTitle:cnArray[index] andEnTitle:enArray[index]];
                [self addSubview:btn];
                btn.tag = index;

                //default selected button
                if (index == 0) {
                    btn.selected = YES;
                    _selectedButton = btn;
                }
                //add target
                [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            }
        }];
    }
    return self;
}
/**
 *  rewrite layoutSubviews method
 */
- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = CGRectMake(0, 0, buttonW, buttonH);
    //add selectedImage
    if (!_selectedView) {
        _selectedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbarItem_selected"]];
        _selectedView.frame = frame;
        [self addSubview:_selectedView];
    }
    //layout the button
    int index = 0;
    for (UIControl *control in self.subviews) {
        if ([control isKindOfClass:[UIButton class]]) {

            control.frame = CGRectOffset(frame, index * buttonW, 0);
            [self bringSubviewToFront:control];
            index++;
        }
    }
}
#pragma  mark - AddTarget
- (void)buttonClicked:(NKTabBarButtonView *)tabBarButton {
    NSInteger index = tabBarButton.tag;
    NSLog(@"%ld",index);
    //change the selectedButton
    _selectedButton.selected = NO;
    _selectedButton = tabBarButton;
    _selectedButton.selected = YES;
    //adjust the frame of the _selectedView
    [UIImageView animateWithDuration:0.2 animations:^{
        _selectedView.x = index * buttonW;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickedButton" object:tabBarButton];
    }];

}

@end
