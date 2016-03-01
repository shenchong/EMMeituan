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


///封装一个创建自定义cell的方法
+(instancetype)lovesCellWithTableView:(UITableView *)tableView;


@end
