//
//  NKNavigationController.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKNavigationController.h"
#import "NKForecastViewController.h"

@interface NKNavigationController ()

@end

@implementation NKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];


}

+ (void)initialize {
    /**
     *  set title theme
     */
    UINavigationBar *navBar = [UINavigationBar appearance];

    NSMutableDictionary *navTitleAttr = [NSMutableDictionary dictionary];
    navTitleAttr[NSForegroundColorAttributeName] = [UIColor blackColor];

    navTitleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];

    [navBar setTitleTextAttributes:navTitleAttr];

    /**
     *  set button title theme
     */
    UIBarButtonItem *navBtn = [UIBarButtonItem appearance];

    NSMutableDictionary *navBtnAttr = [NSMutableDictionary dictionary];
    navBtnAttr[NSForegroundColorAttributeName] = [UIColor blackColor];

    navBtnAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14];

    /**
     *  set button theme
     */
    [navBtn setTitleTextAttributes:navBtnAttr forState:UIControlStateNormal];


}
/**
 *  hide the bottom bar when push
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
/**
 *  status bar theme
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    if ([self.childViewControllers[0] isKindOfClass:[NKForecastViewController class]]/*|[self.childViewControllers[0] isKindOfClass:[DailyForecastViewController class]]*/) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

@end
