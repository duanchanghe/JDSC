//
//  JDShareMyController.m
//  商城模板
//
//  Created by 段昌鹤 on 2016/11/25.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "JDShareMyController.h"
#import "ActionButton.h"
#import "ActionSheetView.h"
#import "VerButton.h"

@interface JDShareMyController ()

@property (nonatomic, copy) NSString *url;
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;
@property (weak, nonatomic) IBOutlet UITextField *shareText;
- (IBAction)clickCopyButton:(UIButton *)sender;
- (IBAction)clickInviteFriendsButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *inviteButton;


@end

@implementation JDShareMyController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//     圆角
    ROUND_ANGLE_VIEW_RADIUS(_inviteButton, 5);
    
    _url = @"https://www.baidu.com/";
    
    _shareText.text = _url;

    
}

- (IBAction)clickCopyButton:(UIButton *)sender
{
    UIAlertView*alet = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已复制到粘贴板" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alet show];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.shareText.text;
    
}

- (IBAction)clickInviteFriendsButton:(UIButton *)sender
{
    NSArray * titleArray = @[@"QQ好友",@"QQ空间",@"微信好友",@"微信朋友圈",];
    NSArray * imageArray = @[@"tcentQQ",@"tcentkongjian",@"wechat",@"wechatquan"];
    ActionSheetView * actionSheet = [[ActionSheetView alloc]initWithShareHeadOprationWith:titleArray andImageArry:imageArray andProTitle:@"测试" and:ShowTypeIsShareStyle];
    
    [actionSheet setBtnClick:^(NSInteger buttonTag) {
        NSLog(@"\n点击第几个====%ld\n当前选中的按钮title====%@",buttonTag,titleArray[buttonTag]);
        if (buttonTag == 0) {
            //分享到QQ
            
            //创建分享消息对象
            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
            
            //创建网页内容对象
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自沃克家的分享" descr:@"沃克家" thumImage:_QRCodeImageView.image];
            //设置网页地址
            shareObject.webpageUrl = _url;
            
            //分享消息对象设置分享内容对象
            messageObject.shareObject = shareObject;
            
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_QQ messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
                NSString *message = nil;
                if (!error) {
                    message = [NSString stringWithFormat:@"分享成功"];
                } else {
                    message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
                    
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }];
            
            
        }else if (buttonTag == 1) {
            //分享到QQ空间
            
            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
            
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自沃克家的分享" descr:@"沃克家"thumImage:_QRCodeImageView.image];
            
            shareObject.webpageUrl = _url;
            
            messageObject.shareObject = shareObject;
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Qzone messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
                NSString *message = nil;
                if (!error) {
                    message = [NSString stringWithFormat:@"分享成功"];
                } else {
                    message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
                    
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }];
            
            
            
        }else if (buttonTag == 2) {
            //分享到微信
            
            
            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
            
            
            
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自沃克家的分享" descr:@"沃克家" thumImage:_QRCodeImageView.image];
            //设置网页地址
            shareObject.webpageUrl = _url;
            NSLog(@"%@",shareObject);
            messageObject.shareObject = shareObject;
            
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
                NSString *message = nil;
                if (!error) {
                    message = [NSString stringWithFormat:@"分享成功"];
                } else {
                    message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
                    
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }];
            
        }else if (buttonTag == 3) {
            //分享到微信朋友圈
            
            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
            
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"来自沃克家的分享" descr:@"沃克家" thumImage:_QRCodeImageView.image];
            
            shareObject.webpageUrl = _url;
            messageObject.shareObject = shareObject;
            
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
                NSString *message = nil;
                if (!error) {
                    message = [NSString stringWithFormat:@"分享成功"];
                } else {
                    message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
                    
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }];
            
        }
        
    }];
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:actionSheet];

    
    
}
- (IBAction)clickCloseButton:(UIButton *)sender
{
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];

    
    
}


@end
