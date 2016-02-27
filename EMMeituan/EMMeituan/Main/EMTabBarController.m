//
//  EMTabBarController.m
//  EMMeituan
//
//  Created by easemob on 16/2/24.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMTabBarController.h"
#import "EMTabBar.h"
#import "homeServiceViewController.h"
#import "EMMoreViewController.h"

@interface EMTabBarController ()

@end

@implementation EMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    EMTabBar *tabBar = [[EMTabBar alloc]init];
    tabBar.delegate = self;// 注册代理要在更改tabBar之前

    //利用kvc设置只可读的属性
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self addChildVC];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self.tabBar layoutSubviews];
}

- (void)addChildVC{
    
    self.tabBar.backgroundImage = [[UIImage imageNamed:@"bg_tabbar"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
//    self.tabBar.selectionIndicatorImage = [[UIImage imageNamed:@"bg_tabbar"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    
    UIViewController *homeVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"首页" Image:@"icon_tabbar_homepage" Controller:homeVC];
    
    homeServiceViewController *worthVC = [[homeServiceViewController alloc]init];
    [self addChildViewControllerWithTitle:@"值得去" Image:@"icon_tabbar_worthgoing" Controller:worthVC];
    
    UIViewController *shopVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"商家" Image:@"icon_tabbar_merchant" Controller:shopVC];
    
    UIViewController *mineVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"我的" Image:@"icon_tabbar_mine" Controller:mineVC];
    
    EMMoreViewController *moreVC = [[EMMoreViewController alloc]init];
    [self addChildViewControllerWithTitle:@"更多" Image:@"icon_tabbar_misc" Controller:moreVC];
}

- (void)addChildViewControllerWithTitle:(NSString *)title Image:(NSString *)image Controller:(UIViewController *)controller{
    
    controller.view.backgroundColor = [UIColor whiteColor];
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",image]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.title = title;
    [self selectedTapTabBarItems:controller.tabBarItem];
    [self unSelectedTapTabBarItems:controller.tabBarItem];
    UINavigationController *navCtl = [[UINavigationController alloc]initWithRootViewController:controller];
    
    [self addChildViewController:navCtl];
}

/**
 *  设置tabbar字体
 */
-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10], UITextAttributeFont,[UIColor grayColor],UITextAttributeTextColor,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10],
                                        UITextAttributeFont,[UIColor colorWithRed:54/255.0f green:185/255.0f blue:175/255.0f alpha:1.0f],UITextAttributeTextColor,
                                        nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
