//
//  EMTabBar.m
//  EMMeituan
//
//  Created by 沈冲 on 16/2/24.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMTabBar.h"
#import "UIView+extension.h"

@implementation EMTabBar


- (void)layoutSubviews{
    [super layoutSubviews];
    
    //计算tabBarButton的宽度
    CGFloat tabBarButtonW = self.width/5;
    CGFloat buttonIndex = 0;
    for (int i=0; i<self.subviews.count; i++) {
        UIView *childView = self.subviews[i];
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childView.width = tabBarButtonW;
            childView.x = buttonIndex*tabBarButtonW;
            
            for (int j=0; j<childView.subviews.count; j++) {
                UIView *childImgView = childView.subviews[j];
                if ([childImgView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    childImgView.size = CGSizeMake(tabBarButtonW/3.5, tabBarButtonW/3.5);
                }
            }
            
            buttonIndex++;
        }
    }
    
}

@end
