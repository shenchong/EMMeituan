//
//  EMSmallFoodView.h
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/29.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMSmallFoods.h"

@interface EMSmallFoodView : UIView
@property (nonatomic,strong) EMSmallFoods * smallFood;

//给外界提过一个快速创建SmallFoodView对象
+(instancetype)smallFoodView;
+(instancetype)smallFoodViewWithsmallFood:(EMSmallFoods *)smallFood;
@end
