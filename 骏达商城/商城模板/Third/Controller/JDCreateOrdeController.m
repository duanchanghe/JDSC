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

@end

@implementation JDCreateOrdeController


- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        [_dataArray addObjectsFromArray:@[@[@"1"],@[@"1",@"1"],@[@"1"]]];
        
        
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSArray *temp = self.dataArray[section];
    return temp.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        JDAddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:addressTableCell];
        
        cell.textLabel.text = @"ddddddd";
        cell.detailTextLabel.text = @" ccccccc";
        
        return cell;

    }else
        
    if (indexPath.section == 1) {
        
        JDGoodsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:goodsTableCell];
        cell.textLabel.text = @"ddddddd";
        cell.detailTextLabel.text = @" ccccccc";
        
        return cell;
        
    }else
    {
        JDPayTableCell *cell = [tableView dequeueReusableCellWithIdentifier:payTableCell];
        
        
        return cell;
    }
    
}

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
