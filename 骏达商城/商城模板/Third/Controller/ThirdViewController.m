//
//  ThirdViewController.m
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "ThirdViewController.h"
#import "JDFirstShoppingCarTableCell.h"
#import "JDSecondShoppingCarTableCell.h"

static NSString *firstTableViewCell = @"JDFirstShoppingCarTableCell";
static NSString *secondTableViewCell = @"JDSecondShoppingCarTableCell";

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArray;


@end

@implementation ThirdViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    


    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setInitialValue];
    
}

- (void)setInitialValue
{
    _mer_id = @"1";
    _opt = @"UserCart/List";
    _token = [self getToken];
    if (_token == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示！"
                                                                       message:@"您还没有登入哦！快去登入吧"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleDestructive
                                                       handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:action];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    }else{
        [self  cartListToken:_token
                       MerID:_mer_id
                       Block:^(NSMutableDictionary *data) {
                           
                           NSArray *rows = data[@"data"][@"rows"];
                           [self.dataArray removeAllObjects];
                           [self.dataArray addObjectsFromArray:rows];
                           [_tableView reloadData];
                       }];
    }
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDFirstShoppingCarTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:firstTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.0];
    cell.dataDict = self.dataArray[indexPath.row];
    [cell.deleteButton addTarget:self action:@selector(updataProduct:) forControlEvents:UIControlEventTouchUpInside];
    [cell.addBtton addTarget:self action:@selector(addProduct:) forControlEvents:UIControlEventTouchUpInside];
    [cell.minusButton addTarget:self action:@selector(minusProduct:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 160;
    
}

- (void)minusProduct:(UIButton *)sender
{
    NSDictionary *dict = [self getDictionary:sender];
    NSString *ID = dict[@"id"];
    NSInteger qt = [dict[@"qty"] integerValue];
    if (qt <= 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最少了！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *canelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [alert addAction:canelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        NSString *qty = [NSString stringWithFormat:@"%ld",qt-1];
        
        [self cartUpdateToken:_token
                        MerID:_mer_id
                      GoodsID:ID
                     GoodsQty:qty
                        Block:^(NSMutableDictionary *data) {
                            NSArray *rows = data[@"data"][@"rows"];
                            [self.dataArray removeAllObjects];
                            [self.dataArray addObjectsFromArray:rows];
                            [_tableView reloadData];
                            
                        }];
        
        

    }
}



- (void)addProduct:(UIButton *)sender
{
    NSDictionary *dict = [self getDictionary:sender];
    NSString *ID = dict[@"id"];
    NSInteger qt = [dict[@"qty"] integerValue];
    NSString *qty = [NSString stringWithFormat:@"%ld",qt+1];
    [self cartUpdateToken:_token
                    MerID:_mer_id
                  GoodsID:ID
                 GoodsQty:qty
                    Block:^(NSMutableDictionary *data) {
                        NSArray *rows = data[@"data"][@"rows"];
                        [self.dataArray removeAllObjects];
                        [self.dataArray addObjectsFromArray:rows];
                        [_tableView reloadData];
                    }];
    
    // 更新购物车
}

// 删除商品
- (void)updataProduct:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要删除 ？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSDictionary *dict = [self updataGetDictionary:sender];
        NSString *ID = dict[@"id"];
        [self cartUpdateToken:_token
                        MerID:_mer_id
                      GoodsID:ID
                     GoodsQty:@"0"
                        Block:^(NSMutableDictionary *data) {
                            NSArray *rows = data[@"data"][@"rows"];
                            [self.dataArray removeAllObjects];
                            [self.dataArray addObjectsFromArray:rows];
                            [_tableView reloadData];
                            
                        }];
    }];
    UIAlertAction *canelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:sureAction];
    [alert addAction:canelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSDictionary *)getDictionary:(UIButton *)button
{
    JDFirstShoppingCarTableCell *cell = (JDFirstShoppingCarTableCell *)button.superview.superview.superview.superview;
    return cell.dataDict;
}

- (NSDictionary *)updataGetDictionary:(UIButton *)button
{
    JDFirstShoppingCarTableCell *cell = (JDFirstShoppingCarTableCell *)button.superview.superview.superview;
    return cell.dataDict;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
