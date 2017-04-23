//
//  ViewController.m
//  XLBasePage
//
//  Created by apple on 17/3/24.
//  Copyright © 2017年 ZXL. All rights reserved.
//

#import "ViewController.h"
#import "ListVC.h"
#import "DetailVC.h"

@interface ViewController () <XLBasePageControllerDelegate,XLBasePageControllerDataSource>

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray = @[@"全部",@"推荐",@"热点",@"附近",@"订阅",@"问答",@"社会",@"体育",@"财经"];

    
    self.delegate = self;
    self.dataSource = self;
    
    //self.lineWidth = 2.0;//选中下划线宽度
    self.titleFont = [UIFont systemFontOfSize:16.0];
    self.defaultColor = [UIColor blackColor];//默认字体颜色
    self.chooseColor = [UIColor redColor];//选中字体颜色
    self.selectIndex = 0;//默认选中第几页
    
    [self reloadScrollPage];
}

-(NSInteger)numberViewControllersInViewPager:(XLBasePageController *)viewPager
{
    return _titleArray.count;
}

-(UIViewController *)viewPager:(XLBasePageController *)viewPager indexViewControllers:(NSInteger)index
{
    if (index != 2) {
        ListVC *listVC = [[ListVC alloc] init];
        listVC.titleStr = _titleArray[index];
        listVC.index = index;
        return listVC;
    }else{
        DetailVC *detailVC = [[DetailVC alloc] init];
        detailVC.titleStr = _titleArray[index];
        detailVC.index = index;
        return detailVC;
    }
}

-(CGFloat)heightForTitleViewPager:(XLBasePageController *)viewPager
{
    return 50;
}

-(NSString *)viewPager:(XLBasePageController *)viewPager titleWithIndexViewControllers:(NSInteger)index
{
    return self.titleArray[index];
}

-(void)viewPagerViewController:(XLBasePageController *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController
{
    self.title = viewController.title;
}

#pragma mark 预留--可不实现

-(UIView *)headerViewForInViewPager:(XLBasePageController *)viewPager
{
    return self.headerView;
}

-(CGFloat)heightForHeaderViewPager:(XLBasePageController *)viewPager
{
    return 100;
}

-(UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor colorWithRed:120/255.0f green:210/255.0f blue:249/255.0f alpha:1];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 40)];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12.0];
        label.text = @"固定的头View,不可跟随滑动,可不显示";
        label.textAlignment = NSTextAlignmentCenter;
        [_headerView addSubview:label];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
