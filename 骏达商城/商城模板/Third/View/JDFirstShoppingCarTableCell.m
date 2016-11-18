//
//  JDFirstShoppingCarTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/16.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDFirstShoppingCarTableCell.h"
#import "UIKit+AFNetworking.h"

@interface JDFirstShoppingCarTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *mer_id;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *goods_id;
@property (nonatomic, copy) NSString *goods_name;
@property (nonatomic, copy) NSString *qty;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *sub_total;
@property (nonatomic, copy) NSString *options;
@property (nonatomic, copy) NSString *cur_price;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) BOOL need_update;

@end

@implementation JDFirstShoppingCarTableCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self fitFont:_detailLabel.font];
    [self fitFont:_priceLabel.font];
    [self fitFont:_priceDetailLabel.font];
    [self fitFont:_deleteButton.titleLabel.font];
    [self fitFont:_addBtton.titleLabel.font];
    [self fitFont:_minusButton.titleLabel.font];
    [self fitFont:_numberText.font];
}

- (void)fitFont:(UIFont *)font
{
    CGFloat size = font.pointSize;
    font = [UIFont systemFontOfSize:size * ([UIScreen mainScreen].bounds.size.width)/414.0];
}

- (IBAction)minusButton:(UIButton *)sender
{
    NSString *str = _numberText.text;
    NSUInteger number = [str integerValue];
    if (number <= 1) {
        _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)number];
    }else{
        _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)--number];
    }
    //  加减操作后  需要跟新购物车
}

- (IBAction)addButton:(UIButton *)sender
{
    NSString *str = _numberText.text;
    NSUInteger number = [str integerValue];
    _numberText.text = [NSString stringWithFormat:@"%ld",(unsigned long)++number];
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    _ID = dataDict[@"id"];
    _mer_id = dataDict[@"mer_id"];
    _user_id = dataDict[@"user_id"];
    _goods_id = dataDict[@"goods_id"];
    _goods_name = dataDict[@"goods_name"];
    _qty = dataDict[@"qty"];
    _price = dataDict[@"price"];
    _sub_total = dataDict[@"sub_total"];
    _icon = dataDict[@"icon"];
    _need_update = [dataDict[@"need_update"] boolValue];
    
    _numberText.text = _qty;
    _priceLabel.text = _sub_total;
    _priceDetailLabel.text = [NSString stringWithFormat:@"￥ %@",_price];
    _detailLabel.text = _goods_name;
    
    [_photoImageView setImageWithURL:[NSURL URLWithString:_icon]];
    
}


@end
