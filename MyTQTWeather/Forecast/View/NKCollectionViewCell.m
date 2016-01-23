//
//  NKCollectionViewCell.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKCollectionViewCell.h"
#import "NKForecastViewController.h"
#import "MJRefresh.h"
#import "NKWeather.h"
#import "NKDataManager.h"
#import "NKCurrentDayInfoView.h"

@interface NKCollectionViewCell () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end



@implementation NKCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didGetLocation) name:@"getLocationSuccessfully" object:nil];
        [self configTableView];
//        [self loadWeather:self.tabelName];
    }
    return self;
}
- (void)didGetLocation {
    [self loadWeather:self.tabelName];
}
- (void)configTableView {
//    NSLog(@"%@",self.contentView);
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.frame style:UITableViewStylePlain];
    [self addSubview:tableView];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;


    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;

    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [self loadWeather:self.tabelName];
    }];

    header.stateLabel.textColor = [UIColor colorWithWhite:1 alpha:0.6];
    header.lastUpdatedTimeLabel.textColor = [UIColor colorWithWhite:1 alpha:0.6];
    
    tableView.mj_header = header;
    [tableView.mj_header beginRefreshing];

    
}

- (void)loadWeather:(NSString *)city {
    NSString *baseURL = @"https://api.heweather.com/x3/weather";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"city"] = city;
    params[@"key"] = @"9dd86bf382474b7d87d9c86cfbdf0cf7";
    if (city) {
        [NKNetworkManager GET:baseURL parameters:params success:^(id reponseObject) {
            //stop refresh
            [self.tableView.mj_header endRefreshing];

            NKWeather *weather = [NKWeather modelWithJSON:reponseObject];
            [NKDataManager archiveWeather:weather withCity:self.tabelName];
            NSLog(@"%@",[NKDataManager getAllCityWeathers]);
            [self.tableView reloadData];
        } failure:^(NSError *error) {
            NSLog(@"%@",error.userInfo);
        }];

    }
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        NKCurrentDayInfoView *view = [[NKCurrentDayInfoView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUNDS_WIDTH, 493)];
        view.weather = [NKDataManager getAllCityWeathers][self.tabelName];
        [cell.contentView addSubview:view];

    }
    if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor grayColor];
    }
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}


@end
