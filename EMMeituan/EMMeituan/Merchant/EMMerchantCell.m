//
//  EMMerchantCell.m
//  EMMeituan
//
//  Created by 沈冲 on 16/2/27.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMMerchantCell.h"

@interface EMMerchantCell ()
@property (nonatomic, weak) UIImageView *merchantImage;
@property (nonatomic, weak) UILabel *merchantNameLabel;
@property (nonatomic, weak) UILabel *addressLabel;
@property (nonatomic, weak) UILabel *evaluateLabel;
@property (nonatomic, weak) UIImageView *starImg;
@end

@implementation EMMerchantCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //店图
        UIImageView *merchantImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 90, 72)];
        merchantImage.layer.masksToBounds = YES;
        merchantImage.layer.cornerRadius = 4;
        self.merchantImage = merchantImage;
        [self.contentView addSubview:merchantImage];
        
        //店名
        UILabel *merchantNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, SCREEN_WIDTH-110-10, 30)];
        merchantNameLabel.font = [UIFont systemFontOfSize:15];
        // Truncate at tail of line: "abcd..."
        merchantNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.merchantNameLabel = merchantNameLabel;
        [self.contentView addSubview:merchantNameLabel];
        
        //星星
        for (int i = 0; i < 5; ++i) {
            UIImageView *starImg = [[UIImageView alloc]initWithFrame:CGRectMake(110+i*14, 43, 12, 12)];
            self.starImg = starImg;
            [self.contentView addSubview:starImg];
            [_starImg setImage:[UIImage imageNamed:@"icon_feedCell_star_full"]];
        }
        
        //评价数
        UILabel *evaluateLabel = [[UILabel alloc]initWithFrame:CGRectMake(110+5*14, 40, 80, 20)];
        evaluateLabel.font = [UIFont systemFontOfSize:13];
        evaluateLabel.textColor = [UIColor lightGrayColor];
        self.evaluateLabel = evaluateLabel;
        [self.contentView addSubview:evaluateLabel];
        
        //地址
        UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 60, SCREEN_WIDTH-110-10, 30)];
        addressLabel.font = [UIFont systemFontOfSize:13];
        addressLabel.textColor = [UIColor lightGrayColor];
        self.addressLabel = addressLabel;
        [self.contentView addSubview:addressLabel];
        
        //下划线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 91.5, SCREEN_WIDTH, 0.5)];
        lineView.backgroundColor = My_Color(192, 192, 192);
        [self.contentView addSubview:lineView];
    }
    return self;
}

- (void)setMerchantModel:(EMMerchantModel *)merchantModel{
    _merchantModel = merchantModel;
    
    NSString *imgUrl = [merchantModel.frontImg stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    _merchantImage.image = [UIImage imageNamed:@"bg_customReview_image_default"];
    
    _merchantNameLabel.text = @"环信(数码大厦)";
    
//    for (int i = 0; i < 5; i++) {
//        [_starImg setImage:[UIImage imageNamed:@"icon_feedCell_star_full"]];
//    }
    
    _evaluateLabel.text = @"999评价";
    
    _addressLabel.text = @"即时通讯云 数码大厦";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
