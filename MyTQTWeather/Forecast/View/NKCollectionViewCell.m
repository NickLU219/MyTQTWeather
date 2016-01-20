//
//  NKCollectionViewCell.m
//  MyTQTWeather
//
//  Created by 陆金龙 on 16/1/19.
//  Copyright © 2016年 Nick. All rights reserved.
//

#import "NKCollectionViewCell.h"

@interface NKCollectionViewCell () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end



@implementation NKCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configTableView];
//        self.tableView.contentOffset
    }
    return self;
}

- (void)configTableView {
//    NSLog(@"%@",self.contentView);
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.frame style:UITableViewStylePlain];
    [self addSubview:tableView];

    tableView.backgroundColor = [UIColor clearColor];
//    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
        cell.backgroundColor = [UIColor redColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
