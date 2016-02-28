//
//  HomeViewController.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#warning TODO //改home页的背景颜色
    self.view.backgroundColor = [UIColor blueColor];
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //设置导航栏
    [self setNav];
    
    
}

///设置导航栏
-(void)setNav
{
    ///创建导航栏
    UIView * navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navView.backgroundColor = [UIColor redColor];
    [self.view addSubview:navView];
    ///1 选择城市
    //城市
    
    //向下箭头
    
    ///2 地图按钮
    
    ///3 搜索框
    //搜索框
    //搜索图片
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
