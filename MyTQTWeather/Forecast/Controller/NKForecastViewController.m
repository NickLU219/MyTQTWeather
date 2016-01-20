//
//  NKForecastViewController.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKForecastViewController.h"
#import "NKCollectionViewCell.h"
#import "NKCityForecastFrame.h"
#import "NKVoiceButton.h"
#import "NKSharedButton.h"

@interface NKForecastViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
/**
 *  backGroundImageView
 */
@property (nonatomic, weak) UIImageView *backgroundView;
/**
 *  collectionView
 */
@property (nonatomic, weak) UICollectionView *collectionView;
/**
 *  cityFrameArray
 */
@property (nonatomic, copy) NSMutableArray<NKCityForecastFrame *> *cityFrames;
@end

@implementation NKForecastViewController
- (NSArray<NKCityForecastFrame *> *)cityFrames {
    if (!_cityFrames) {
        _cityFrames = [NSMutableArray array];
    }
    return _cityFrames;
}
#pragma mark - Main
- (void)viewDidLoad {
    [super viewDidLoad];
    //configNavigationBar
    [self configNavigationBar];
    //configCollectionView
    [self configCollectionView];

    self.navigationItem.title = @"+定位中...";

    //
    [NKLocationManager getUserLocation:^(double lat, double lon, NSString *locName) {
        NSLog(@"%@",locName);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.title = [NSString stringWithFormat:@"+%@",locName];
        });
    }];


}
#pragma mark - ConfigUI
- (void)configNavigationBar {
    //backgroundImageView
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImage *backgroundImage = [UIImage imageNamed:@"cloudy"];
#warning TODO: change "imageByBlurRadius"
    UIImage *blurBackImage = [backgroundImage imageByBlurRadius:0 tintColor:nil tintMode:0 saturation:1 maskImage:nil];
    CGRect imageFrame = CGRectMake(0, 0, SCREEN_BOUNDS_WIDTH, SCREEN_BOUNDS_HEIGHT - 49);

    self.view.backgroundColor = [UIColor colorWithPatternImage:[blurBackImage OriginImageScaleToSize:imageFrame.size]];

    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"forecast_navigationbar_firstscreen"] forBarMetrics:UIBarMetricsDefault];
    }

    if ([self.navigationController.navigationBar respondsToSelector:@selector(shadowImage)])
    {
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    }

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[NKVoiceButton alloc] init]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[NKSharedButton alloc] init]];
}

- (void)configCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0.0;
    flowLayout.minimumLineSpacing = 0.0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(SCREEN_BOUNDS_WIDTH, SCREEN_BOUNDS_HEIGHT - 64 - 49);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_BOUNDS_WIDTH, SCREEN_BOUNDS_HEIGHT - 64 - 49) collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    [collectionView registerClass:[NKCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    collectionView.showsHorizontalScrollIndicator = YES;
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cityFrames.count == 0 ? 3 : self.cityFrames.count;
}



@end
