//
//  HomeViewController.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "HomeViewController.h"
#import "MapViewController.h"
#import "SearchViewController.h"
#import "SanViewController.h"
#import "EMLoves.h"
#import "EMLovesCell.h"
#import "EMFoodCell.h"
#import "EMSmallFoods.h"
#import "EMSmallFoodView.h"
#import "EMShopCell.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
///导航栏向下的箭头
@property (nonatomic,weak)UIImageView *arrowImage;

///点击城市按钮出现的遮盖
@property (nonatomic,weak)UIView * coverView;
///选择城市的大空间
@property (nonatomic,weak)UIButton * selectCityBtn;

///猜你喜欢的数据
@property (nonatomic,strong)NSArray * loves;

///美食数据
@property (nonatomic,strong)NSArray * foods;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //设置导航栏
    [self setNav];
    
    //初始化tableView
    [self initTableView];
    
    NSLog(@"猜你喜欢的数据%@",self.loves);
    NSLog(@"美食数据%@",self.foods);
    
}

///设置导航栏
-(void)setNav
{
    ///创建导航栏
    UIView * navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navView.backgroundColor = My_Color(33, 192, 174);
    [self.view addSubview:navView];
    ///1 选择城市
    //城市
    UIButton * cityBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 40, 25)];
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cityBtn setTitle:@"北京" forState:UIControlStateNormal];
    [cityBtn addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:cityBtn];
    
    //向下箭头
    UIImageView * arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_homepage_downArrow"]];
    arrowImage.frame = CGRectMake(CGRectGetMaxX(cityBtn.frame), 38, 13, 10);
    [navView addSubview:arrowImage];
    self.arrowImage = arrowImage;
    
    ///2 地图按钮
    UIButton * mapBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 42, 28, 42, 30)];
    [mapBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(mapButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:mapBtn];
    
    ///3 搜索框
    //搜索框
    UIButton * searchView = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame)+21, 28, CGRectGetMinX(mapBtn.frame)-21-CGRectGetMaxX(cityBtn.frame)-36, 30)];
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = 14;
    [searchView addTarget:self action:@selector(searchViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:searchView];
    
    //搜索图片
    UIImageView * searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7, 15, 15)];
    searchImage.image = [UIImage imageNamed:@"icon_homepage_search"];
    [searchView addSubview:searchImage];
    
    //站位文字
    UILabel * placeHolerLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, CGRectGetWidth(searchView.frame)-22, 30)];
    placeHolerLabel.text = @"主人想搜什么，点这里哦";
    placeHolerLabel.font = [UIFont systemFontOfSize:14];
    placeHolerLabel.textColor = [UIColor grayColor];
    [searchView addSubview:placeHolerLabel];
    
    ///4 扫一扫
    CGFloat sanBtnWH = 24;
    UIButton * sanBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 42 - sanBtnWH , 32, sanBtnWH, sanBtnWH)];
    [sanBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_scan"] forState:UIControlStateNormal];
    [sanBtn addTarget:self action:@selector(sanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:sanBtn];
}

///初始化tableView
-(void)initTableView{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    //刷新
    [self setUpTableView];
}

//tableView刷新
-(void)setUpTableView
{
    NSLog(@"tableView刷新");
#warning TODO 后续添加刷新效果
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //1 分类Class
    //2 名店抢购
    //3 美食1元吃吃吃
    //4 购物商场
    //5 热门频道hot
    //6 猜你喜欢Love
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 5) {
        return self.loves.count + 1;
//        return 1;
    }else if(section == 4 ||section == 3 ||section == 2){
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///猜你喜欢Loves
    if (indexPath.section == 5) {
        if (indexPath.row == 0 ) {
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.textLabel.text = @"猜你喜欢";
            cell.imageView.image = [UIImage imageNamed:@"猜你"];
            return cell;
        }else if (indexPath.row != 0){
            //1 获取模型数据
            EMLoves * models = self.loves[indexPath.row-1];
            //2 创建单元格
            EMLovesCell * cell = [EMLovesCell lovesCellWithTableView:tableView ];
            
            //3 把模型数据赋值给单元格
            cell.Loves = models;
            
            //4 返回单元格
            return cell;
        }
    }
    
    ///热门频道hot
    if (indexPath.section == 4) {
        if (indexPath.row == 0 ) {
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.textLabel.text = @"热门频道";
            cell.imageView.image = [UIImage imageNamed:@"热门"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }else if (indexPath.row != 0){
            //1 获取模型数据
            EMLoves * models = self.loves[0];
            //2 创建单元格
            EMLovesCell * cell = [EMLovesCell lovesCellWithTableView:tableView ];
            
            //3 把模型数据赋值给单元格
            cell.Loves = models;
            
            //4 返回单元格
            return cell;
        }
    }
    
    ///购物商场shop
    if (indexPath.section == 3) {
        if (indexPath.row == 0 ) {
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.textLabel.text = @"购物商场";
            cell.imageView.image = [UIImage imageNamed:@"购物"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }else if (indexPath.row != 0){
            static NSString * ID = @"Shops_cell";
            EMShopCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"EMShopCell" owner:nil options:nil] lastObject];
                //设置购物数据
                [self setShopData:cell];
            }
            
            //4 返回单元格
            return cell;
        }
    }
    ///美食1元吃吃吃
    if (indexPath.section == 2) {
        if (indexPath.row == 0 ) {
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.textLabel.text = @"美食1元吃吃吃";
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:23];
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.detailTextLabel.text = @"新用户专享  海量美味";
            cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
            cell.detailTextLabel.textColor = [UIColor grayColor];
            cell.imageView.image = [UIImage imageNamed:@"美食"];
            
            return cell;
        }else if (indexPath.row != 0){

            static NSString * ID = @"Foods_cell";
            EMFoodCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell == nil) {
                //通过Xib来加载cell
                cell = [[[NSBundle mainBundle] loadNibNamed:@"EMFoodCell" owner:nil options:nil] firstObject];
                //设置美食数据
                [self setFoodData:cell];
            }
            //4 返回单元格
            return cell;
        }
    }

    ///2 名店抢购
    ///1 分类Class


#warning TODO 后续修改，根据各个单元格的具体情况修改
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"主人，你好！";
    return cell;
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 180;
    }else if(indexPath.section == 1){
        return 150;
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            return 70;
        }
        return 140;
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            return 35;
        }else{
            return 110;
        }

    }else if(indexPath.section == 4){
        if (indexPath.row == 0) {
            return 35;
        }else{
            return 100;
        }

    }else if(indexPath.section == 5){
        if (indexPath.row == 0) {
            return 35;
        }else{
            return 100;
        }
    }
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
    headerView.backgroundColor = My_Color(239, 239, 244);
    return headerView;
}
// custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
    headerView.backgroundColor = My_Color(239, 239, 244);
    return headerView;
}


#pragma mark 按钮点击事件
// 城市按钮的点击事件
-(void)cityButtonClick:(UIButton *)cityBtn
{
    NSLog(@"城市按钮被点击了，主人出去游玩，要换地方啦！");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    self.arrowImage.transform = CGAffineTransformRotate(self.arrowImage.transform, M_PI);
    [UIView commitAnimations];
    
    
    UIWindow * mainWindow = [UIApplication sharedApplication].keyWindow;
    ///1 创建一个遮盖的UIView
    UIView * coverView = [[UIView alloc] initWithFrame:mainWindow.bounds];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.3;
    [mainWindow addSubview:coverView];
    self.coverView = coverView;
    UITapGestureRecognizer *coverViewTouch=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeCoverViewAndSelectCityButton)];
    [self.coverView addGestureRecognizer:coverViewTouch];
    
    
    ///2 再创建一个UIButton用来做城市的旋转,给这个Button添加点击事件，点击关闭
#warning TODO 高度需要改的
    CGFloat selectCityBtnH = 300;
    UIButton * selectCityBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, mainWindow.bounds.size.width, selectCityBtnH)];
    [selectCityBtn setBackgroundColor:[UIColor whiteColor]];
    [selectCityBtn setTitle:@"主人在这里更改城市选择" forState:UIControlStateNormal];
    [selectCityBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [selectCityBtn addTarget:self action:@selector(selectCityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    // 不能把selectCityBtn添加到coverView里面, 因为coveView的半透明的, 这样的化, 它的子控件也会半透明
    [mainWindow addSubview:selectCityBtn];
    self.selectCityBtn = selectCityBtn;
    
}

//地图按钮的点击事件
-(void)mapButtonClick:(UIButton *)mapBtn
{
    NSLog(@"主人对这个城市不熟悉，要查一下具体位置啊");
    MapViewController * mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

//搜索框按钮的点击事件
-(void)searchViewButtonClick:(UIButton *)searchView
{
    NSLog(@"主人想要搜索，热门服务快点过来啊！");
    SearchViewController * searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}

//扫一扫按钮的点击事件
-(void)sanButtonClick:(UIButton *)sanBtn
{
    NSLog(@"主人想要扫一扫哦，可能要付费咯！");
    SanViewController * sanVC = [[SanViewController alloc] init];
    [self.navigationController pushViewController:sanVC animated:YES];
    
}

//选择城市的点击事件
-(void)selectCityButtonClick:(UIButton *)button
{
    NSLog(@"选择城市");
    ///button隐藏，遮盖删除
    [self removeCoverViewAndSelectCityButton];
}

//移除遮盖，城市选择button
-(void)removeCoverViewAndSelectCityButton
{
    //1 移除城市选择button
    [self.selectCityBtn removeFromSuperview];
    //2 移除遮盖
    [self.coverView removeFromSuperview];

}

#pragma mark - 提取出的方法

-(void)setShopData:(EMShopCell *)cell
{
#warning TOTO 
    
}
-(void)setFoodData:(EMFoodCell *)cell
{
    for (int i = 0; i < self.foods.count; i++) {
        //1 创建一个已经设置完数据的格子
        EMSmallFoodView * smallFV = [EMSmallFoodView smallFoodViewWithsmallFood:self.foods[i]];
        //2 添加到父控件
        [cell addSubview:smallFV];
        //3 计算和设计frame
        CGFloat smallFVH = 70;
        CGFloat smallFVW = self.view.frame.size.width * 0.5;
        //一行放2个格子
        //行号
        int row = i / 2;
        //列号
        int col = i % 2;
        CGFloat smallX =smallFVW * col;
        CGFloat smallY =smallFVH * row;
        smallFV.frame = CGRectMake(smallX, smallY, smallFVW, smallFVH);
    }
}

#pragma mark - 懒加载数据
-(NSArray *)loves
{
    if (_loves == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"loves.plist" ofType:nil];
        NSArray * arrayDicts = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * arrayM = [NSMutableArray array];
        for (NSDictionary * dict in arrayDicts) {
            EMLoves * Model = [EMLoves lovesWithDict:dict];
            [arrayM addObject:Model];
        }
        _loves = arrayM;
    }
    return _loves;
}

-(NSArray *)foods
{
    if (_foods == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        NSArray * arrayDicts = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * arrayM = [NSMutableArray array];
        for (NSDictionary * dict in arrayDicts) {
            EMSmallFoods * Model = [EMSmallFoods smallFoodWithDict:dict];
            [arrayM addObject:Model];
        }
        _foods = arrayM;
    }
    return _foods;
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
