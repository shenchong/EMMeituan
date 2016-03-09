//
//  EMShopCell.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/3/1.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMShopCell.h"

#define HM_IMAGE_COUNT 5


@interface EMShopCell()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
@implementation EMShopCell

- (void)awakeFromNib {
    // Initialization code
    
    // 1. 添加5张图片
    for (int i = 0; i < HM_IMAGE_COUNT; i++) {
        // 1. 创建UIImageView
        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 2. 添加到scrollView
        [self.scrollView addSubview:imageView];
        
        // 3. 设置frame
        CGFloat imageY = 0;
        CGFloat imageW = 110;
        CGFloat imageH = 110;
        CGFloat martin = 5;
        CGFloat imageX = (imageW + martin)* i;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        // 4. 设置图片
        NSString *name = [NSString stringWithFormat:@"img_%02d", i+1];
        imageView.image = [UIImage imageNamed:name];
    }
    
    // 2. 设置scrollView的滚动范围
    CGSize contentSize = CGSizeMake((110 + 5) * HM_IMAGE_COUNT, 0);
    self.scrollView.contentSize =  contentSize;
    
    // 3. 不显示滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 4. 分页
    // 分页的原理:scrollView内部会以scrollView.frame.size.wigth的宽度为一个单位, 对scrollView内部需要展示的所有内容进行分割
//    self.scrollView.pagingEnabled = YES;
    
//    // 5. 设置页码
//    self.pageControl.numberOfPages = 5;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
