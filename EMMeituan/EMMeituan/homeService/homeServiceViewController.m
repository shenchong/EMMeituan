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
#import "homeServiceWebViewController.h"


@interface homeServiceViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,NSXMLParserDelegate>

{
    NSMutableArray *homeServiceArray;
}

@property (nonatomic, strong)UICollectionView *downCollectionView;


@end

@implementation homeServiceViewController

- (void)viewWillAppear:(BOOL)animated {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getServiceAdvData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    homeServiceArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)getServiceAdvData {
    NSString *urlStr = @"http://vip.yijia.com/shop_app/data/tmp_vip_get_data.php?kind=1";
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/",@"text/xml",@"text/plain", @"text/html", nil];
    
//    session.requestSerializer = [AFHTTPRequestSerializer serializer];
//    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    

    [session GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [homeServiceArray removeAllObjects];
        
        NSMutableArray *dataArray = [(NSDictionary *)responseObject objectForKey:@"list"];
        for (int i = 0; i < dataArray.count; i++) {
            homeServiceModel *model = [homeServiceModel objectWithKeyValues:dataArray[i]];
            [homeServiceArray addObject:model];
        }
        [_downCollectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


//NSXMLParser *parsers = [[NSXMLParser alloc]initWithData:(NSData *)responseObject];
//        parsers.delegate = self;
//        [parsers parse];


- (void)collectionView {
    [_downCollectionView removeFromSuperview];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
//    [flowLayout setItemSize:CGSizeMake(SCREEN_WIDTH/2-6, 200*(SCREEN_HEIGHT/1000.0))];
    _downCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_HEIGHT-TABAR_HEIGHT-50 ) collectionViewLayout:flowLayout];
    _downCollectionView.backgroundColor = kUIColorFromRGB(0xe0e3ea, 1);
//    _downCollectionView.bounces = YES;
    _downCollectionView.delegate = self;
    _downCollectionView.dataSource = self;
    
    //注册Cell，必须要有
    
//    [_downCollectionView registerClass:[homeServiceCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    [_downCollectionView registerNib:[UINib nibWithNibName:@"homeServiceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"homeServiceCollectionViewCell"];
    [self.view addSubview:_downCollectionView];
}

#pragma UICollectionViewDataSource

- (homeServiceCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"homeServiceCollectionViewCell";
    static BOOL nibMyCellloaded = NO;
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:@"homeServiceCollectionViewCell" bundle: nil];
        [_downCollectionView registerNib:nib forCellWithReuseIdentifier:identifier];
        nibMyCellloaded = YES;
    }
    
    homeServiceCollectionViewCell *cell = (homeServiceCollectionViewCell *)[_downCollectionView dequeueReusableCellWithReuseIdentifier:@"homeServiceCollectionViewCell" forIndexPath:indexPath];
    homeServiceModel *model = homeServiceArray[indexPath.row];
    cell.cellBackgroundLabel.text = model.title;
    [cell.cellBackgroundImageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:nil];
    cell.oldPrice.text = [NSString stringWithFormat:@"¥%@",model.reservePrice];
    cell.nowPrice.text = [NSString stringWithFormat:@"¥%@",model.salePrice];
    cell.monthSell.text = [NSString stringWithFormat:@"月售%@",model.monthSell];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return homeServiceArray.count;
}

#pragma UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH/2-6, 200*(SCREEN_HEIGHT/400.0));
}

#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    homeServiceModel *model = homeServiceArray[indexPath.row];
    NSString *urlStr = [NSString stringWithFormat:@"http://cloud.yijia.com/goto/item.php?app_id=3274372329&app_oid=0584ae39d88a53a399a5bbc1d934adc2&app_dtoken=be9d3bba55d2ab63cdee0023aac441c38a7ec9fe8ed9d92c6dea3036f44d9a32&app_version=1.0.7&app_channel=AppStore&id=%@&sche=tiantiantehui",model.auctionId];
    homeServiceWebViewController *webViewController = [[homeServiceWebViewController alloc]init];
//    webViewController.hidesBottomBarWhenPushed = YES;
    webViewController.strUrl = urlStr;
    [self.navigationController pushViewController:webViewController animated:YES];
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

#pragma NSXMLParserDelegate

// 3. 发现文字 － 一个节点内容，方法会执行多次
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"===> %@", string);
}



// 5. 文档结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"5. 结束文档%@",parser);
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
