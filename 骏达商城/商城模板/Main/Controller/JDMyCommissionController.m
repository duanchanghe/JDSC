//
//  JDMyCommissionController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/28.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDMyCommissionController.h"

@interface JDMyCommissionController ()

@end

@implementation JDMyCommissionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)clickCloseButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

@end
