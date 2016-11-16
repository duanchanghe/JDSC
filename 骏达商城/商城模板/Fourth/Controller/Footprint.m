//
//  Footprint.m
//  商城模板
//
//  Created by kura on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "Footprint.h"

@interface Footprint ()

@end

@implementation Footprint

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.945 green:0.941 blue:0.961 alpha:1.00];
}

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

@end
