//
//  DCHTabBarViewController.m
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "DCHTabBarViewController.h"
#import "DCHTabBar.h"


@interface DCHTabBarViewController ()<DCHtabBarDelegate,UITabBarDelegate>

@end

@implementation DCHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:self.myTabbar forKey:@"tabBar"];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self revolveView:self.myTabbar.addButton];
}

// 视图旋转方法
- (void)revolveView:(UIView *)view
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (DCHTabBar *)myTabbar
{
    if (!_myTabbar) {
        _myTabbar = [[DCHTabBar alloc]init];
        _myTabbar.barTintColor = RGBA(55, 84, 98, 1);
        _myTabbar.tintColor = [UIColor redColor];
        _myTabbar.unselectedItemTintColor = [UIColor grayColor];
        _myTabbar.tabBarDelegate = self;
    }
    return _myTabbar;
}


- (void)addButtonClick:(DCHTabBar *)tabBar
{
    NSLog(@"点击了 button");
}


@end
