//
//  JDAddressDetailTableCell.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/23.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDAddressDetailTableCell.h"

@interface JDAddressDetailTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *defualtButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


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


@implementation JDAddressDetailTableCell


- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    _address = dataDict[@"address"];
    _area_id = dataDict[@"area_id"];
    _ares_text = dataDict[@"ares_text"];
    _ID = dataDict[@"id"];
    _is_default = dataDict[@"is_default"];
    _name = dataDict[@"name"];
    _phone = dataDict[@"phone"];
    _postcode = dataDict[@"postcode"];
    _status = dataDict[@"status"];
    _user_id = dataDict[@"user_id"];
    
    _nameLabel.text = _name;
    _phoneLable.text = _phone;
    _detailLabel.text = _address;
    
    if ([_is_default boolValue]) {
        _defualtButton.selected = YES;
    }else{
        _defualtButton.selected = NO;
    }
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
