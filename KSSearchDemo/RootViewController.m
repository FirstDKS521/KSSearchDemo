//
//  RootViewController.m
//  KSSearchDemo
//
//  Created by aDu on 2018/4/12.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import "RootViewController.h"
#import "KSSearchResultController.h"

//判断是否是iPhoneX
#define isIphoneX (Screen_Width == 375.f && Screen_Height == 812.f ? YES : NO)
//状态栏和导航栏的总高度
#define StatusNav_Height (isIphoneX ? 88 : 64)
//获取屏幕的宽度和高度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface RootViewController ()

@property (nonatomic, strong) KSSearchResultController *resultVC;
@property (nonatomic, strong) UISearchController *searchVC;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.tableView];
    
    KSSearchResultController *result = [[KSSearchResultController alloc] init];
    //如果要在当前视图显示搜索框，则不需要result，但是需要在当前控制中接收UISearchResultsUpdating协议
    self.searchVC = [[UISearchController alloc] initWithSearchResultsController:result];
    self.tableView.tableHeaderView = _searchVC.searchBar;
    //A Boolean value that indicates whether this view controller's view is covered when the view controller or one of its descendants presents a view controller.
    //一个布尔值,用于显示这个视图控制器的视图是否覆盖当视图控制器或其后代提供了一个视图控制器
    self.definesPresentationContext = YES;
    _searchVC.searchResultsUpdater = result;
}

#pragma mark ====== UITableViewDelegate ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%@行", @(indexPath.row)];
    return cell;
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
