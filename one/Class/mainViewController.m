//
//  mainViewController.m
//  NewOne
//
//  Created by 蕾 on 15/9/23.
//  Copyright © 2015年 蕾. All rights reserved.
//

#import "mainViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MainModel.h"
#import "mianCollectionViewCell.h"

@interface mainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    
    NSMutableArray *_dataArray;
    MainModel * _model;
    
}
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray = [NSMutableArray array];

    super.collectionView.delegate = self;
    super.collectionView.dataSource = self;
    [self dowload];

}

- (void)dowload{
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
    df2.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr2 = [df2 stringFromDate:[NSDate date]];
    for (int i = 1; i <=10; i++) {
        NSString * urlString=[NSString stringWithFormat:@"http://bea.wufazhuce.com/OneForWeb/one/getHp_N?strDate=%@&strRow=%d",dateStr2,i];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *apps = dict[@"hpEntity"];
            _model = [[MainModel alloc] init];
            [_model setValuesForKeysWithDictionary:apps];
            
            [_dataArray addObject:_model];
            [super.aiView startAnimating];
            [super.aiView removeFromSuperview];
            [self.collectionView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        
    }
    
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}
//创建cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    mianCollectionViewCell * cell = [mianCollectionViewCell cellWithTableView:collectionView andIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    
    return cell;
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
