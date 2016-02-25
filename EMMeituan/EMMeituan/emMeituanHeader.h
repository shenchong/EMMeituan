//
//  emMeituanHeader.h
//  EMMeituan
//
//  Created by EaseMob on 16/2/25.
//  Copyright © 2016年 easemob. All rights reserved.
//

#ifndef emMeituanHeader_h
#define emMeituanHeader_h

#define  TABAR_HEIGHT self.tabBarController.tabBar.frame.size.height
#define  NAV_HEIGHT self.navigationController.navigationBar.frame.size.height
#define STATUS 20

//屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//判断是否为iPhone5的宏 宏后面是结果那一定要加括号
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568.f)
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480.f) ? YES : NO
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)


//字体适配
#define FontSizeChange(float) iPhone6Plus?[UIFont systemFontOfSize:(float*1.2)]:[UIFont systemFontOfSize:float]\
//字体黑体
#define boldFontSizeChange(float) iPhone6Plus?[UIFont boldSystemFontOfSize:(float*1.2)]:[UIFont boldSystemFontOfSize:float]\

//色值
#define kUIColorFromRGB(rgbValue, _alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]
//rgb
#define My_Color(a,b,c) [UIColor colorWithRed:(a)/255.0f green:(b)/255.0f blue:(c)/255.0f alpha:1.0]

#define VIEW_X(view)    CGRectGetMinX(view.frame)
#define VIEW_Y(view)    CGRectGetMinY(view.frame)
#define VIEW_WIDTH(view)   CGRectGetWidth(view.frame)
#define VIEW_HEIGHT(view)   CGRectGetHeight(view.frame)

#endif /* emMeituanHeader_h */
