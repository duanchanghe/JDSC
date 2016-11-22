//
//  JDGoodsTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDGoodsTableCell.h"


@interface JDGoodsTableCell ()


@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

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


@implementation JDGoodsTableCell


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
    _sub_total = dataDict[@"sub_tatal"];
    _icon = dataDict[@"icon"];
    _need_update = dataDict[@"need_update"];
    _detailLabel.text = _goods_name;
    _priceLabel.text = [NSString stringWithFormat:@"￥ %@",_price];
    _countLabel.text = [NSString stringWithFormat:@"X %@",_qty];
    _totalLabel.text = [NSString stringWithFormat:@"合计：￥ %ld",[_qty integerValue] * [_price integerValue]];
    _totalCountLabel.text = [NSString stringWithFormat:@"共计%@件商品",_qty];
    [_photoView setImageWithURL:[NSURL URLWithString:_icon]];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
