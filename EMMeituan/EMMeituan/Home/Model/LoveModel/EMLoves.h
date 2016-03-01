//
//  EMLoves.h
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMLoves : NSObject

@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * desc;
@property (nonatomic,copy)NSString * price;
@property (nonatomic,copy)NSString * cheap;
@property (nonatomic,copy)NSString * sell;
@property (nonatomic,copy)NSString * distance;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)lovesWithDict:(NSDictionary *)dict;


@end
