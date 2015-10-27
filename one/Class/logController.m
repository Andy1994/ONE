//
//  logViewController.m
//  onedemo
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "logController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface logController ()

@end

@implementation logController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.navigationBar.alpha = 0;
    UIImageView *im = [[UIImageView alloc]initWithFrame:self.view.bounds];
    im.image = [UIImage imageNamed:@"login_background"];
    [self.view addSubview:im];
    [self creatUI];
}
- (void)creatUI{
    UIImageView *im = [[UIImageView alloc]init];
    im.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
    im.bounds = CGRectMake(0, 0, 115, 35);
    im.image = [UIImage imageNamed:@"login_logo"];
    [self.view addSubview:im];
    UILabel *label = [[UILabel alloc]init];
      label.center = CGPointMake(ScreenWidth/2, ScreenHeight/4);
    label.bounds = CGRectMake(0, 0, 100, 35);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"丛蕾";
    [self.view addSubview:label];
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
