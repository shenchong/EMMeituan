//
//  UIView+extension.m
//  NBWeiBo
//
//  Created by easemob on 16/2/24.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "UIView+extension.h"

@implementation UIView (extension)


-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


-(CGFloat)x{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(CGFloat)height{
    return self.frame.size.height;
}


-(void)setSize:(CGSize)size{
    CGRect frame =  self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}


-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

//-(void)setCorRd:(CGFloat)corRd{
//    //设置view身上layer的cornerRadius
//    self.layer.cornerRadius = corRd;
//    //让layer的cornerRadius属性起作用(让layer按最真实的效果显示出来)
//    self.layer.masksToBounds = corRd>0;
//}
//
//-(CGFloat)corRd{
//    return self.layer.cornerRadius;
//}


@end
