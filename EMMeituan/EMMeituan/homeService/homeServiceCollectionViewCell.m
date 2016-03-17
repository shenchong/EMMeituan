//
//  homeServiceCollectionViewCell.m
//  EMMeituan
//
//  Created by EaseMob on 16/2/27.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "homeServiceCollectionViewCell.h"

@implementation homeServiceCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}



- (homeServiceCollectionViewCell *)initWithModel:(homeServiceModel *)model {
    
    homeServiceCollectionViewCell *cell = [[homeServiceCollectionViewCell alloc]init];
    [cell.cellBackgroundLabel sizeToFit];
    [cell.oldPrice sizeToFit];
    [cell.nowPrice sizeToFit];
    [cell.monthSell sizeToFit];
    
    return cell;
}

- (UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

@end
