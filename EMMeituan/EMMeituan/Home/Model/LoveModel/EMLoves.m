//
//  EMLoves.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMLoves.h"

@implementation EMLoves

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)lovesWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
