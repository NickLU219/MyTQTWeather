//
//  NKMainViewController.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKMainViewController.h"
#import "NKForecastViewController.h"
#import "NKLifeTableViewController.h"
#import "NKLiveViewController.h"
#import "NKMeTableViewController.h"
#import "NKTabbar.h"
#import "NKTabBarButtonView.h"
#import "NKNavigationController.h"

@interface NKMainViewController ()
/**
 *  自定义tabbar
 */
@property (nonatomic, weak) NKTabbar *myTabBar;

@property (nonatomic, copy) void(^titleBlock)(NSArray<NSString *> *cnArray, NSArray<NSString *> *enArray);

@end

static NSMutableArray<NSString *> *_cnArr;
static NSMutableArray<NSString *> *_enArr;

@implementation NKMainViewController
#pragma mark - Main
- (void)viewDidLoad {
    [super viewDidLoad];
    _cnArr = [NSMutableArray array];
    _enArr = [NSMutableArray array];

    [self setUpChildViewControllers];

    [self configTabBar];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //remove all views except some [NKTabBarButtonView Class];
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[NKTabBarButtonView class]]) {
            [view removeFromSuperview];
        }
    }

    //regist notify
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCurrentPage:) name:@"didClickedButton" object:nil];
}
//notify SEL
- (void)changeCurrentPage:(NSNotification *)notify {
    NKTabBarButtonView *button = notify.object;
//    NSLog(@"%ld",button.tag);
//    NSLog(@"%ld",self.selectedIndex);
//    NSLog(@"%@",self.childViewControllers);
    self.selectedIndex = button.tag;
}

#pragma mark - Block
+ (void)getCnTitleAndEnTitle:(void (^)(NSArray<NSString *> *, NSArray<NSString *> *))titleBlock {
    __weak typeof(self) weakSelf = self;
    [[weakSelf alloc] getCnTitleAndEnTitle:titleBlock];
}

- (void)getCnTitleAndEnTitle:(void (^)(NSArray<NSString *> *, NSArray<NSString *> *))titleBlock {
    self.titleBlock = [titleBlock copy];

    self.titleBlock(_cnArr, _enArr);
}


#pragma mark - ConfigUIAndChildViewController
- (void)configTabBar {
    NKTabbar *myTabBar = [[NKTabbar alloc] init];
    self.myTabBar = myTabBar;
    [self setValue:myTabBar forKey:@"tabBar"];
}

- (void)setUpChildViewControllers {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Controller.json" ofType:nil];

    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];

    NSArray<NSDictionary *> *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];

    for (NSDictionary *vc in jsonArray) {
        [self addChildViewController:vc[@"ViewControllerName"] withCnTitle:vc[@"cnTitle"] enTitle:vc[@"enTitle"]];
    }
}

- (void)addChildViewController:(NSString *)childControllerName withCnTitle:(NSString *)cnTitle enTitle:(NSString *)enTitle {
    [_cnArr addObject:cnTitle];
    [_enArr addObject:enTitle];

    Class class = NSClassFromString(childControllerName);

    UIViewController *childViewController = [[class alloc] init];
    childViewController.title = cnTitle;

    NKNavigationController *nav = [[NKNavigationController alloc] initWithRootViewController:childViewController];

    [self addChildViewController:nav];

}

@end
