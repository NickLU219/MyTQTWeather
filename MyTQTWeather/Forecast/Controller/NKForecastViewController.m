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
#import "NKTitleView.h"


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
/**
 *  titleView
 */
@property (nonatomic, weak) NKTitleView *titleView;
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

//    self.navigationItem.title = @"+定位中...";

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

    NKTitleView *titleView = [[NKTitleView alloc] initWithTitle:@"定位中..."];
    self.navigationItem.titleView = titleView;
    self.titleView = titleView;
    
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

    if (indexPath.item == 0) {
        [NKLocationManager getUserLocation:^(double lat, double lon, NSString *locName) {
            cell.tabelName = locName;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getLocationSuccessfully" object:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.titleView.text = [NSString stringWithFormat:@"+ %@", locName];
            });
        }];


    }



    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cityFrames.count == 0 ? 3 : self.cityFrames.count;
}


#pragma mark - get weather info
- (void)getWeatherInfo:(NSString *)city {
//    NSLog(@"%@",city);
//    NSString *baseURL = @"https://api.heweather.com/x3/weather";
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"city"] = city;
//    params[@"key"] = @"9dd86bf382474b7d87d9c86cfbdf0cf7";
//    [NKNetworkManager GET:baseURL parameters:params success:^(id reponseObject) {
//        __weak typeof(self) weakSelf = self;
//        weakSelf.data(reponseObject);
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error.userInfo);
//    }];
//    
}

//+ (void)getData:(void (^)(id))data {
//
//    [[self alloc] getData:data];
//}
//- (void)getData:(void (^)(id))data {
//    __weak typeof(self) weakSelf = self;
//    self.data = [data copy];
//}
@end
