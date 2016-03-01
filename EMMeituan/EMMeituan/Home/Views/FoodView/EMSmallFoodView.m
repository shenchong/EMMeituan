//
//  EMSmallFoodView.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/29.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMSmallFoodView.h"
@interface EMSmallFoodView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
@implementation EMSmallFoodView


+(instancetype)smallFoodViewWithsmallFood:(EMSmallFoods *)smallFood
{
    EMSmallFoodView * smallFoodView = [self smallFoodView];
    smallFoodView.smallFood = smallFood;
    return smallFoodView;
}

+(instancetype)smallFoodView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"EMSmallFoodView" owner:nil options:nil] lastObject];
}

-(void)setSmallFood:(EMSmallFoods *)smallFood
{
    _smallFood = smallFood;
    
    self.iconImageView.image = [UIImage imageNamed:smallFood.icon];
    self.titleLabel.text = smallFood.title;
//    UIColor * Color = (UIColor *)[NSString stringWithFormat:@"%@Color",smallFood.color];
//    self.titleLabel.textColor = Color;
    self.descLabel.text = smallFood.desc;
    
}

-(void)setIconImageView:(UIImageView *)iconImageView
{
    _iconImageView = iconImageView;
    iconImageView.layer.masksToBounds = YES;
    iconImageView.layer.cornerRadius = 27;
}

@end
