//
//  Macros.h
//  商城模板
//
//  Created by jundanuantong on 16/11/8.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// 屏幕
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)
#define RealScaleFactor SCREEN_WIDTH / 375

// 颜色
#define ColorWithRGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define ColorWithWhite(w)         [UIColor colorWithWhite:w alpha:1]
#define ColorWithWhiteAlpha(w,a)  [UIColor colorWithWhite:w alpha:a]
#define RGBA(r,g,b,a)             [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)                [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


// 字体
#pragma mark - font

#define FontWithNameSize(name, size)    [UIFont fontWithName:name size:size]
#define FontWithSize(size)              [UIFont systemFontOfSize:size]
#define ScoreFontWithSize(fontSize)     [UIFont fontWithName:@"Bradley Hand" size:fontSize]
#define BoldFontWithSize(size)          [UIFont boldSystemFontOfSize:size]
#define BoldSystemFont(size)            [UIFont boldSystemFontOfSize:size]
#define systemFont(size)                [UIFont systemFontOfSize:size]

// weakObj
#pragma mark - weakObj

#define WeakObj(o)                      __weak typeof(o) o##Weak = o;
#define StrongObj(o)                    __strong typeof(o) o = o##Weak;

// 沙盒
#pragma mark - sandbox

#define SandBox_Home                NSHomeDirectory()
#define SandBox_Tmp                 [NSString stringWithFormat:@"%@/tmp/",NSHomeDirectory()]
#define SandBox_Documents           [NSString stringWithFormat:@"%@/Documents/",NSHomeDirectory()]
#define SandBox_Caches              [NSString stringWithFormat:@"%@/Library/Caches/",NSHomeDirectory()]
#define SandBox_Cookies             [NSString stringWithFormat:@"%@/Library/Cookies/",NSHomeDirectory()]
#define SandBox_Preferences         [NSString stringWithFormat:@"%@/Library/Preferences/",NSHomeDirectory()]

// 圆角控件
#pragma mark - 圆角控件

#define ROUND_ANGLE_VIEW(view)                  view.layer.masksToBounds = YES;view.layer.cornerRadius = view.height/2.0
#define ROUND_ANGLE_VIEW_RADIUS(view,r)         view.layer.masksToBounds = YES;view.layer.cornerRadius = r


#define URI                                     @"http://wkj.miliwudao.com/api"


#define StoryboardIdentifier(indentifier)        [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:indentifier]


#endif /* Macros_h */
