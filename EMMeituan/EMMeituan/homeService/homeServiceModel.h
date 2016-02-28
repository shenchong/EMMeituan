//
//  homeServiceModel.h
//  EMMeituan
//
//  Created by EaseMob on 16/2/27.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeServiceModel : NSObject

@property(nonatomic, strong) NSString *background;
@property(nonatomic, strong) NSNumber *cateId;
@property(nonatomic, strong) NSString *cateImgUrl;
@property(nonatomic, strong) NSString *cateName;
@property(nonatomic, strong) NSString *clickable;

@property(nonatomic, strong) NSString *jumpType;
@property(nonatomic, strong) NSString *jumpUrl;
@property(nonatomic, strong) NSString *open;
@property(nonatomic, strong) NSString *showType;

@end
