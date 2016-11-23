//
//  JDCreateOrdeController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/18.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDCreateOrdeController.h"
#import "JDAddressTableCell.h"
#import "JDGoodsTableCell.h"
#import "JDPayTableCell.h"
#import "JDAddressController.h"

static NSString *addressTableCell = @"JDAddressTableCell";
static NSString *goodsTableCell = @"JDGoodsTableCell";
static NSString *payTableCell = @"JDPayTableCell";
@interface JDCreateOrdeController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *doneOrderButton;
@property (weak, nonatomic) IBOutlet UILabel *allDetailLabel;


@end

@implementation JDCreateOrdeController

// 数据数组 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
//         获取地址
        [self addressListBlock:^(NSMutableDictionary *dataDic) {
            NSDictionary *data = dataDic[@"data"];
            NSArray *rows = data[@"rows"];
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 0; i < rows.count; i++) {
                NSDictionary *dic = rows[i];
                if ([dic[@"is_default"] boolValue]) {
                    [arr addObject:rows[i]];
                }
            }
            [_dataArray insertObject:arr atIndex:0];
            
//             获取购物车清单
            [self cartListBlock:^(NSMutableDictionary *dataDic) {
                NSDictionary *data = dataDic[@"data"];
                NSArray *rows = data[@"rows"];
                [_dataArray insertObject:rows atIndex:1];
                [_dataArray insertObject:@[@" "] atIndex:2];
                
                NSString *total_item =  [NSString stringWithFormat:@"%@", data[@"total_item"]];
                NSString *total_amount = [NSString stringWithFormat:@"￥%@", data[@"total_amount" ]];
                NSString *total = [NSString stringWithFormat:@"共计%@件商品 合计：%@",total_item,total_amount];
//                 给底部视图的 label 写入属性字符串
                NSRange range = [total rangeOfString:total_amount];
                NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor lightGrayColor],NSForegroundColorAttributeName,nil];
                NSMutableAttributedString *totalAttributes = [[NSMutableAttributedString alloc] initWithString:total attributes:attributes];
                NSDictionary *attributes1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName,nil];
                [totalAttributes addAttributes:attributes1 range:NSMakeRange(2, total_item.length)];
                [totalAttributes addAttributes:attributes1 range:range];
                self.allDetailLabel.attributedText = totalAttributes;
                
                [_tableView reloadData];
            }];
        }];

    }
    return _dataArray;
}


- (void)viewWillAppear:(BOOL)animated
{
    _doneOrderButton.layer.masksToBounds = YES;
    _doneOrderButton.layer.cornerRadius = 5;

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

// tableView 每组行数
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSArray *temp = self.dataArray[section];
    return temp.count;
}

// 给 tableViewCell 赋值
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *temp = self.dataArray[indexPath.section];
    if (indexPath.section == 0)
    {
        JDAddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:addressTableCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dataDict = temp[indexPath.row];
        return cell;
    }else
        
    if (indexPath.section == 1) {
        JDGoodsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:goodsTableCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dataDict = temp[indexPath.row];
        return cell;
    }else
    {
        JDPayTableCell *cell = [tableView dequeueReusableCellWithIdentifier:payTableCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

// 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 108;
    }else if (indexPath.section == 1)
    {
        return 170;
    }else
    {
        return 137;
    }
}

// cell 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        JDAddressController *vc = StoryboardIdentifier(@"JDAddressController");
        [self.navigationController pushViewController:vc animated:YES];

    }else if (indexPath.section == 1)
    {
        JDGoodsDetailController *vc = StoryboardIdentifier(@"JDGoodsDetailController");
        NSDictionary *dic = self.dataArray[indexPath.section][indexPath.row];
        vc.goods_id = dic[@"goods_id"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
    
}



@end
