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

// 视图旋转动画
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

// 弹出动画





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
    _view1  = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREN_HEIGHT)];
    _view1.backgroundColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:0.0];
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, SCREN_HEIGHT - SCREEN_WIDTH, SCREEN_WIDTH, SCREEN_WIDTH)];
    control.backgroundColor = RGBA(50, 50, 50, 0.7);
    
    [_view1 addSubview:control];
    CGFloat W = 100;
    CGFloat Margin = (SCREEN_WIDTH - 200)/3.0;
    
    UIButton*but1 = [[UIButton alloc]initWithFrame:CGRectMake(Margin, Margin, W, W)];
    [but1 setImage:[UIImage imageNamed:@"朋友圈1"] forState:UIControlStateNormal];
    [but1 setTitle:@"分享沃克家" forState:UIControlStateNormal];
    [self initButton:but1];
    [but1 addTarget:self action:@selector(ShareWKJ) forControlEvents:UIControlEventTouchUpInside];
    [control addSubview:but1];
    
    UIButton*but2 = [[UIButton alloc]initWithFrame:CGRectMake(2*Margin + W, Margin, W, W)];
    [but2 setImage:[UIImage imageNamed:@"推广账户1"] forState:UIControlStateNormal];
    [but2 setTitle:@"推广账户" forState:UIControlStateNormal];
    [self initButton:but2];
    [but2 addTarget:self action:@selector(SHareMY) forControlEvents:UIControlEventTouchUpInside];
    [control addSubview:but2];
    
    UIButton*but3 = [[UIButton alloc]initWithFrame:CGRectMake(Margin, 2*Margin + W, W, W)];
    [but3 setImage:[UIImage imageNamed:@"我的积分"] forState:UIControlStateNormal];
    [but3 setTitle:@"积分兑换" forState:UIControlStateNormal];
    [self initButton:but3];
    [but3 addTarget:self action:@selector(JF) forControlEvents:UIControlEventTouchUpInside];
    [control addSubview:but3];
    
    UIButton*but4 = [[UIButton alloc]initWithFrame:CGRectMake(2*Margin + W, 2*Margin + W, W, W)];
    [but4 setImage:[UIImage imageNamed:@"我的佣金"] forState:UIControlStateNormal];
    [but4 setTitle:@"我的佣金" forState:UIControlStateNormal];
    [self initButton:but4];
    [but4 addTarget:self action:@selector(YJ) forControlEvents:UIControlEventTouchUpInside];
    [control addSubview:but4];
    
    [self.view addSubview:_view1];
    [control addTarget:self action:@selector(ViewFire) forControlEvents:UIControlEventTouchDown];
    [_view1 addTarget:self action:@selector(ViewFire) forControlEvents:UIControlEventTouchDown];
    
}


-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height + 50 ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
    btn.backgroundColor = [UIColor redColor];
}

-(void)ViewFire{
    [_view1 removeFromSuperview];
    _view1 = nil;
    
}

-(void)YJ{
    
}

-(void)JF{
    
}
-(void)SHareMY{
    
}
-(void)ShareWKJ{

    
    
}




@end
