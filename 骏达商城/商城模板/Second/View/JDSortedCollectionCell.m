//
//  JDSortedCollectionCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/15.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDSortedCollectionCell.h"

@interface JDSortedCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

@property (nonatomic, copy) NSString *brand_id;
@property (nonatomic, copy) NSString *catalog_id;
@property (nonatomic, copy) NSString *cheap;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *create_at;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *end_at;
@property (nonatomic, copy) NSString *highlight;
@property (nonatomic, copy) NSString *hot;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, assign) BOOL is_fav;
@property (nonatomic, copy) NSString *mer_id;
@property (nonatomic, copy) NSString *meta_description;
@property (nonatomic, copy) NSString *meta_keywords;
@property (nonatomic, copy) NSString *meta_title;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *points;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *price_guide;
@property (nonatomic, copy) NSString *price_market;
@property (nonatomic, copy) NSString *pv;
@property (nonatomic, copy) NSString *recommend;
@property (nonatomic, copy) NSString *sales;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *start_at;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *sys_goods_id;
@property (nonatomic, copy) NSString *sys_goods_pid;
@property (nonatomic, copy) NSString *tags;


@end

@implementation JDSortedCollectionCell


- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)fitFont:(UIFont *)font
{
    CGFloat size = font.pointSize;
    font = [UIFont systemFontOfSize:size * ([UIScreen mainScreen].bounds.size.width)/414.0];
    
}


- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    _brand_id = dataDict[@"brand_id"];
    _catalog_id = dataDict[@"catalog_id"];
    _cheap = dataDict[@"cheap"];
    _comments = dataDict[@""];
    _create_at = dataDict[@"create_at"];
    _created_at = dataDict[@"created_at"];
    _currency = dataDict[@"currency"];
    _desc = dataDict[@"desc"];
    _end_at = dataDict[@"end_at"];
    _highlight = dataDict[@"highlight"];
    _hot = dataDict[@"hot"];
    _icon = dataDict[@"icon"];
    _ID = dataDict[@"id"];
    _is_fav = [dataDict[@"is_fav"] boolValue];
    _mer_id = dataDict[@"mer_id"];
    _meta_description = dataDict[@"meta_description"];
    _meta_keywords = dataDict[@"meta_keywords"];
    _meta_title = dataDict[@"meta_title"];
    _name = dataDict[@"name"];
    _pid = dataDict[@"pid"];
    _points = dataDict[@"points"];
    _price = dataDict[@"price"];
    _price_guide = dataDict[@"price_guide"];
    _price_market = dataDict[@"price_market"];
    _pv = dataDict[@"pv"];
    _recommend = dataDict[@"recommend"];
    _sales = dataDict[@"sales"];
    _sort = dataDict[@"sort"];
    _start_at = dataDict[@"start_at"];
    _status = dataDict[@"status"];
    _sys_goods_id = dataDict[@"sys_goods_id"];
    _sys_goods_pid = dataDict[@"sys_goods_pid"];
    _tags = dataDict[@"tags"];
    
    _nameLabel.text = _name;
    [self fitFont:_nameLabel.font];
    [self fitFont:_priceLabel.font];
    [self fitFont:_firstLabel.font];
    [self fitFont:_secondLabel.font];
    [self fitFont:_thirdLabel.font];
    
    [_imageView setImageWithURL:[NSURL URLWithString:_icon]];
    NSString *temStr = _price_market;
    NSString *str = [NSString stringWithFormat:@"¥ %.0ld",[temStr integerValue]];
    NSDictionary *attrbuted = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:str attributes: attrbuted];
    [attString setAttributes:@{[UIFont systemFontOfSize:15]:NSFontAttributeName} range:NSMakeRange(0, 1)];
    _priceLabel.attributedText = attString;
    [_priceLabel sizeToFit];
    
}




@end
