//
//  JDGoodsDetailController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDGoodsDetailController.h"

@interface JDGoodsDetailController ()
@property (nonatomic, copy)NSMutableArray *dataArray;
@end

@implementation JDGoodsDetailController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
  
    }
    return _dataArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"%@",_goods_id);
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {

//    self.tabBarController.tabBar.hidden = NO;

    
}


@end
