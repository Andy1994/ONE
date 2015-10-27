//
//  appListViewController.m
//  NewOne
//
//  Created by 蕾 on 15/9/23.
//  Copyright © 2015年 蕾. All rights reserved.
//

#import "appListViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface appListViewController ()<UIActionSheetDelegate>

@property (nonatomic,weak)UIActionSheet *actionSheet;

@end

@implementation appListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
    [self creatTableView];
}


-(void)creatTableView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake( [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-49-64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.pagingEnabled = YES;
    [self.view addSubview:_collectionView];
    
    _aiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _aiView.center = CGPointMake(ScreenWidth/2, (ScreenHeight-64-49)/2);
    [self.collectionView addSubview:_aiView];
    [_aiView startAnimating];
}


- (UIActionSheet *)actionSheet{
    
    if (_actionSheet == nil) {
        
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"新浪",@"腾讯微博",@"QQ控件",@"微信",nil];
        _actionSheet = actionSheet;
        [_actionSheet showInView:self.view];
        
    }
    return _actionSheet;
}
- (void)creatUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navback7_iPad@2x.png"] forBarMetrics:UIBarMetricsDefault];
    UIImageView *im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navLogo@2x.png"]];
    im.frame = CGRectMake(0, 0, 56, 34/2);
    self.navigationItem.titleView = im;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 38/2, 11/2);
    [button setBackgroundImage:[UIImage imageNamed:@"shareBtn@2x.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)share:(UIButton *)button{
    //
    [self actionSheet];

    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

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
