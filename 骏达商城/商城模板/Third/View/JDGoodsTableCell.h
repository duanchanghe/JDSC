//
//  JDGoodsTableCell.h
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDGoodsTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *messageText;
@property (nonatomic, copy) NSDictionary *dataDict;


@end
