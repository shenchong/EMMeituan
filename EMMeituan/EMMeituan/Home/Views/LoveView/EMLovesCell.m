//
//  EMLovesCell.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMLovesCell.h"
@interface EMLovesCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *cheapText;
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
@implementation EMLovesCell

///封装一个创建自定义cell的方法
+(instancetype)lovesCellWithTableView:(UITableView *)tableView{
    static NSString * ID = @"Loves_cell";
    EMLovesCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        //通过xib来加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EMLovesCell" owner:self options:nil] firstObject];
    }
    return cell;
}


-(void)setLoves:(EMLoves *)Loves
{
    _Loves = Loves;
    
    //把模型中的数据设置给对应的子控件
    self.iconImageView.image = [UIImage imageNamed:Loves.icon];
    self.titleLabel.text = Loves.title;
    self.descLabel.text = Loves.desc;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",Loves.price];
    self.cheapText.text = [NSString stringWithFormat:@"立减%@",Loves.cheap];
    self.sellLabel.text = [NSString stringWithFormat:@"已售%@",Loves.sell];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@m",Loves.distance];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
