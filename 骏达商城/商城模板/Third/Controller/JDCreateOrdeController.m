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

static NSString *addressTableCell = @"JDAddressTableCell";
static NSString *goodsTableCell = @"JDGoodsTableCell";
static NSString *payTableCell = @"JDPayTableCell";
@interface JDCreateOrdeController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JDCreateOrdeController

// 数据数组 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        // 获取购物车清单
        [self cartListBlock:^(NSMutableDictionary *data) {
            
//            NSLog(@"%@",data);
            
            
            
        }];
        
        
        
        [_dataArray addObjectsFromArray:@[@[@"1"],@[@"1",@"1"],@[@"1"]]];
    }
    return _dataArray;
}

- (void)viewWillAppear:(BOOL)animated
{

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
    UITableViewCell *cell = nil;
    if (indexPath.section == 0)
    {
        cell = (JDAddressTableCell *)[tableView dequeueReusableCellWithIdentifier:addressTableCell];
        cell.textLabel.text = @"ddddddd";
        cell.detailTextLabel.text = @" ccccccc";

    }else
        
    if (indexPath.section == 1) {
        
        cell = (JDGoodsTableCell *)[tableView dequeueReusableCellWithIdentifier:goodsTableCell];
        cell.textLabel.text = @"ddddddd";
        cell.detailTextLabel.text = @" ccccccc";
        
    }else
    {
        cell = (JDPayTableCell *)[tableView dequeueReusableCellWithIdentifier:payTableCell];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.height - 5, SCREEN_WIDTH, 5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview: view];
    
    return cell;
    
}

// 每组 tableViewCell 头标题
- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
    {

        return nil;
        
    }else
        
    if (section == 1) {
            

            
        return nil;
            
    }else
    {
            
            
        return @"请选择支付方式";
    }
}






@end
