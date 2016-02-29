//
//  EMSmallFoods.h
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/29.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMSmallFoods : NSObject

@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * desc;
//@property (nonatomic,copy)NSString * color;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)smallFoodWithDict:(NSDictionary *)dict;

@end
