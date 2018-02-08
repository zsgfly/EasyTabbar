//
//  TabbarController.m
//  JD
//
//  Created by 腾盈 on 2018/2/7.
//  Copyright © 2018年 腾盈. All rights reserved.
//

#import "TabbarController.h"
#import "EasyTabbar.h"
#import "ViewController.h"

@interface TabbarController ()<EasyTabbarDelegate>

@property (nonatomic, strong) EasyTabbar *tabbar;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentIndex = 0;
    NSMutableArray *vcArray = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        UINavigationController *navVc = [UINavigationController new];
        UIViewController *vc;
        vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        navVc.viewControllers = @[vc];
        [vcArray addObject:navVc];
    }
    self.viewControllers = vcArray;
    
    
    _tabbar = [EasyTabbar new];
    _tabbar.delegate = self;
    _tabbar.titleArray = @[@"首页",@"发现",@"健康",@"购物",@"我的"];
    _tabbar.normalImageArray = @[@"1",@"2",@"3",@"1",@"4"];
    _tabbar.selectedImageArray = @[@"11",@"22",@"33",@"11",@"44"];
    [self.tabBar addSubview:_tabbar];
    _tabbar.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
}
- (void)didSelectedIndex:(NSInteger)index{
    if (_currentIndex == index) {
        //刷新当前页面?
        self.selectedIndex = index;
        _currentIndex = index;
    }else{
        self.selectedIndex = index;
        _currentIndex = index;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
