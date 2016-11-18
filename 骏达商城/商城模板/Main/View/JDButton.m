//
//  JDButton.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDButton.h"

@interface JDButton ()

@end

@implementation JDButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [super awakeFromNib];
        _photoView.layer.masksToBounds = YES;
        _photoView.layer.cornerRadius = CGRectGetWidth(_photoView.frame);
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    _photoView.layer.masksToBounds = YES;
    _photoView.layer.cornerRadius = CGRectGetWidth(_photoView.frame);
    
}


@end
