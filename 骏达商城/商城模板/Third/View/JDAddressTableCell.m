//
//  JDAddressTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDAddressTableCell.h"

@interface JDAddressTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *area_id;
@property (nonatomic, copy) NSString *ares_text;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *is_default;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *postcode;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *user_id;


@end



@implementation JDAddressTableCell


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self fitFont:_nameLabel.font];
    [self fitFont:_PhoneLabel.font];
    [self fitFont:_addressLabel.font];
}

- (void)fitFont:(UIFont *)font
{
    CGFloat size = font.pointSize;
    font = [UIFont systemFontOfSize:size * ([UIScreen mainScreen].bounds.size.width)/414.0];
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    _ID = dataDict[@"id"];
    _user_id = dataDict[@"user_id"];
    _address = dataDict[@"address"];
    _area_id = dataDict[@"_area_id"];
    _ares_text = dataDict[@"res_text"];
    _is_default = dataDict[@"is_default"];
    _name = dataDict[@"name"];
    _phone = dataDict[@"phone"];
    _postcode = dataDict[@"postcode"];
    _status = dataDict[@"status"];
    
    _nameLabel.text = [NSString stringWithFormat:@"收货人: %@", _name];
    _PhoneLabel.text = [NSString stringWithFormat:@"联系电话: %@", _phone];
    _addressLabel.text = [NSString stringWithFormat:@": %@", _address];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
