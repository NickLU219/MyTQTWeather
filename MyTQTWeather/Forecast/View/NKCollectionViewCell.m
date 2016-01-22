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


@interface NKCollectionViewCell () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
/**  <#PS#> */
@property (nonatomic, strong) NKWeather *weather;
//@property (nonatomic, strong) MJRefreshHeader *header;
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
//    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadWeather:)];
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

            self.weather = [NKWeather modelWithJSON:reponseObject];
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
        cell.backgroundColor = [UIColor grayColor];
    }
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
