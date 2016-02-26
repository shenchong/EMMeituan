//
//  homeServiceViewController.m
//  EMMeituan
//
//  Created by EaseMob on 16/2/25.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "homeServiceViewController.h"


@interface homeServiceViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)UICollectionView *downCollectionView;


@end

@implementation homeServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    
    [self collectionView];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)collectionView {
    [_downCollectionView removeFromSuperview];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setItemSize:CGSizeMake(SCREEN_WIDTH/2-16, 200*(SCREEN_HEIGHT/568.0))];
    _downCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS-NAV_HEIGHT-TABAR_HEIGHT) collectionViewLayout:flowLayout];
    _downCollectionView.backgroundColor = kUIColorFromRGB(0xe0e3ea, 1);
//    _downCollectionView.bounces = YES;
    _downCollectionView.delegate = self;
    _downCollectionView.dataSource = self;
    //注册Cell，必须要有
    [_downCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    [self.view addSubview:_downCollectionView];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [_downCollectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
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
