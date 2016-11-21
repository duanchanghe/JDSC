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

{
    
    SEL JF;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:self.myTabbar forKey:@"tabBar"];
    
    [self performSelector:@selector(JF) withObject:nil afterDelay:5];
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
        
        // 真机9.4的系统上不能用
//        _myTabbar.unselectedItemTintColor = [UIColor grayColor];
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
    
    
    NSArray *array = @[@[@"我的积分",@"测试图片"]
                       ,@[@"我的积分",@"测试图片"]
                       ,@[@"我的积分",@"测试图片"]
                       ,@[@"我的积分",@"测试图片"]];
    
    
    int r = 3;
    int l = 3;
    
    CGFloat W = 100;

    CGFloat x = control.frame.size.width / (CGFloat)r;
    CGFloat y = control.frame.size.width / (CGFloat)l;

    for (int i = 1; i < r; i++) {
        
        for (int j = 1; j < l; j++) {
            int m = 0;
            MyButton *button =
            [[[NSBundle mainBundle] loadNibNamed:@"MyButton"
                                           owner:nil
                                         options:nil]
             lastObject];
            button.width = W;
            button.height = W;
            button.centerX = x*i;
            button.centerY = y*j;
            button.phoneView.image = [UIImage imageNamed:array[m][0]];
            button.textLabel.text = array[m][1];
            [control addSubview:button];
            button.actionControl.tag = m;
            m++;
            [button.actionControl addTarget:self
                                     action:@selector(Buttonclick:)
                           forControlEvents:UIControlEventTouchUpInside];
        }
    }
    [self.view addSubview:_view1];
    [control addTarget:self action:@selector(ViewFire) forControlEvents:UIControlEventTouchDown];
    [_view1 addTarget:self action:@selector(ViewFire) forControlEvents:UIControlEventTouchDown];
    
}


- (void)Buttonclick:(UIControl *)sender
{
    switch (sender.tag) {
        case 0:
        {
//            [self ]
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        default:
            break;
    }
}


-(void)ViewFire{
    [_view1 removeFromSuperview];
    _view1 = nil;
    
}

-(void)YJ{
    
}

-(void)JF{
    NSLog(@"uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
}
-(void)SHareMY{
    
}
-(void)ShareWKJ{
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自沃克家的分享" descr:@"沃克家" thumImage:[UIImage imageNamed:@"收藏"]];
    
    shareObject.webpageUrl = @"http://wkj.miliwudao.com/wap/index/index";
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}




@end
