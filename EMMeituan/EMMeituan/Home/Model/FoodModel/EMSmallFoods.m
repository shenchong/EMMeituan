//
//  EMSmallFoods.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/29.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMSmallFoods.h"

@implementation EMSmallFoods

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)smallFoodWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
