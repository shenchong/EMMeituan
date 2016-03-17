//
//  homeServiceCollectionViewCell.h
//  EMMeituan
//
//  Created by EaseMob on 16/2/27.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeServiceModel.h"

@interface homeServiceCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *cellBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellBackgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *nowPrice;
@property (weak, nonatomic) IBOutlet UILabel *monthSell;


- (homeServiceCollectionViewCell *)initWithModel:(homeServiceModel *)model;




@end
