//
//  KSSearchResultController.m
//  KSSearchDemo
//
//  Created by aDu on 2018/4/12.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import "KSSearchResultController.h"

//判断是否是iPhoneX
#define isIphoneX (Screen_Width == 375.f && Screen_Height == 812.f ? YES : NO)
//状态栏和导航栏的总高度
#define StatusNav_Height (isIphoneX ? 88 : 64)
//获取屏幕的宽度和高度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface KSSearchResultController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KSSearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.tableView];
    //解决搜索结果没有紧挨着搜索框显示问题
    self.definesPresentationContext = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark ====== UITableViewDelegate ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"结果%@行", @(indexPath.row)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.presentingViewController.navigationController pushViewController:vc animated:YES];
}

#pragma mark ====== init ======
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - StatusNav_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

@end
