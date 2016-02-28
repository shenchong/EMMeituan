//
//  homeServiceViewController.m
//  EMMeituan
//
//  Created by EaseMob on 16/2/25.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "homeServiceViewController.h"
#import "homeServiceCollectionViewCell.h"
#import "AFNetworking.h"
#import "homeServiceModel.h"

@interface homeServiceViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

{
    NSMutableArray *homeServiceArray;
}

@property (nonatomic, strong)UICollectionView *downCollectionView;


@end

@implementation homeServiceViewController

- (void)viewWillAppear:(BOOL)animated {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getServiceAdvData];
        [self getHomeServiewData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    homeServiceArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)getServiceAdvData {
    NSString *urlStr = @"https://api.meituan.com/apollo/index?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=fZgLxmKv3t4SJLEnmK%2FpVquwJfs%3D&__skno=E9781389-B5C0-47E7-9C45-678C0CE3A25D&__skts=1436146268.971232&__skua=bd6b6e8eadfad15571a15c3b9ef9199a&ci=1&clientType=ios&movieBundleVersion=100&msid=48E2B810-805D-4821-9CDD-D5C9E01BC98A2015-07-06-09-25492&userid=10086&utm_campaign=AgroupBgroupD100Fab_chunceshishuju__a__a___b1junglehomepagecatesort__b__leftflow___ab_gxhceshi__nostrategy__leftflow___ab_gxhceshi0202__b__a___ab_pindaochangsha__a__leftflow___ab_xinkeceshi__b__leftflow___ab_gxtest__gd__leftflow___ab_waimaiwending__a__a___ab_gxh_82__nostrategy__leftflow___ab_pindaoshenyang__a__leftflow___i_group_5_2_deallist_poitype__d__d___ab_b_food_57_purepoilist_extinfo__a__a___ab_i_group_5_3_poidetaildeallist__a__b___ab_pindaoquxincelue0630__b__b1___a20141120nanning__m1__leftflow___ab_waimaizhanshi__b__b1___ab_i_group_5_5_onsite__b__b___ab_i_group_5_6_searchkuang__a__leftflowGonsite&utm_content=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&utm_medium=iphone&utm_source=AppStore&utm_term=5.7&uuid=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&version_name=5.7";
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [homeServiceArray removeAllObjects];
        NSMutableArray *dataArray = [responseObject objectForKey:@"data"];
        for (int i = 0; i < dataArray.count; i++) {
            homeServiceModel *model = [homeServiceModel objectWithKeyValues:dataArray[i]];
            [homeServiceArray addObject:model];
        }
        [_downCollectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)getHomeServiewData {
    
}

- (void)collectionView {
    [_downCollectionView removeFromSuperview];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(0, -62);
    [flowLayout setItemSize:CGSizeMake(SCREEN_WIDTH/2-6, 200*(SCREEN_HEIGHT/1000.0))];
    _downCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS-NAV_HEIGHT-TABAR_HEIGHT) collectionViewLayout:flowLayout];
    _downCollectionView.backgroundColor = kUIColorFromRGB(0xe0e3ea, 1);
//    _downCollectionView.bounces = YES;
    _downCollectionView.delegate = self;
    _downCollectionView.dataSource = self;
    //注册Cell，必须要有
    [_downCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    [self.view addSubview:_downCollectionView];
}

- (homeServiceCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    homeServiceCollectionViewCell *cell = [_downCollectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[homeServiceCollectionViewCell alloc]initWithModel:homeServiceArray[indexPath.row]];
    }
    homeServiceModel *model = homeServiceArray[indexPath.row];
    cell.backgroundColor = [self stringTOColor:model.background];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return homeServiceArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
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
