//
//  EMLovesCell.h
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMLoves.h"
@interface EMLovesCell : UITableViewCell

@property(nonatomic,strong) EMLoves * Loves;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *cheapText;
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;



///封装一个创建自定义cell的方法
+(instancetype)lovesCellWithTableView:(UITableView *)tableView;


@end
