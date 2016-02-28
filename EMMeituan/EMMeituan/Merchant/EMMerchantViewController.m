//
//  EMMerchantViewController.m
//  EMMeituan
//
//  Created by 沈冲 on 16/2/27.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "EMMerchantViewController.h"
#import "EMMerchantCell.h"
#import "EMMerchantModel.h"

@interface EMMerchantViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation EMMerchantViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    [self setNav];
    [self initViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)setNav{
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    backView.backgroundColor = My_Color(250, 250, 250);
//    backView.backgroundColor = [UIColor redColor];
    [self.view addSubview:backView];
    
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = My_Color(192, 192, 192);
    [backView addSubview:lineView];
    
    //地图
    UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.frame = CGRectMake(10, 30, 23, 23);
    [mapBtn setBackgroundImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
//    [mapBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:mapBtn];
    
    //搜索
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(SCREEN_WIDTH-42, 30, 23, 23);
    [searchBtn setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
//    [searchBtn addTarget:self action:@selector(OnSearchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:searchBtn];
    
    //segment
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"全部商品",@"优惠商家"]];
    segment.x = (SCREEN_WIDTH-140)/2;
    segment.y = 25;
    segment.width = 140;
    segment.tintColor = My_Color(77, 193, 181);
    //设置segment的背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"bg_button_single"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"bg_button_single_hl"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"bg_button_single_hl"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //设置segment的字体
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],
                                             NSForegroundColorAttributeName: [UIColor whiteColor]};
    [segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],
                                               NSForegroundColorAttributeName: My_Color(77, 193, 181)};
    [segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [segment setSelectedSegmentIndex:0];
    [backView addSubview:segment];
    
}

-(void)initViews{
    //筛选
    UIView *filterView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    filterView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:filterView];
    
    NSArray *filterName = @[@"全部",@"全部",@"智能排序"];
    //筛选
    for (int i = 0; i < 3; i++) {
        //文字
        UIButton *filterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        filterBtn.frame = CGRectMake(i*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3-15, 40);
        filterBtn.tag = 100+i;
        filterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [filterBtn setTitle:filterName[i] forState:UIControlStateNormal];
        [filterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [filterBtn setTitleColor:My_Color(33, 192, 174) forState:UIControlStateSelected];
//        [filterBtn addTarget:self action:@selector(OnFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [filterView addSubview:filterBtn];
        
        //三角
        UIButton *triangleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        triangleBtn.frame = CGRectMake((i+1)*SCREEN_WIDTH/3-15, 16, 8, 7);
        triangleBtn.tag = 120+i;
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_normal"] forState:UIControlStateNormal];
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_selected"] forState:UIControlStateSelected];
        [filterView addSubview:triangleBtn];
    }
    
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = My_Color(192, 192, 192);
    [filterView addSubview:lineView];
    
    //tableview
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+40, SCREEN_WIDTH, SCREEN_HEIGHT-64-40-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"merchantCell";
    EMMerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[EMMerchantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    EMMerchantModel *model;
    cell.merchantModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
