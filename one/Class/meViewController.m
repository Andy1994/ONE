//
//  meViewController.m
//  NewOne
//
//  Created by 蕾 on 15/9/23.
//  Copyright © 2015年 蕾. All rights reserved.
//

#import "meViewController.h"
#import "setViewController.h"
#import "aboutViewController.h"
#import "logController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width/320
#define ScreenHeight [UIScreen mainScreen].bounds.size.height/568
@interface meViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
}
@end

@implementation meViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    
}

-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth*320, ScreenHeight*568) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    //    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        logController * log = [[logController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
        
    }else if(indexPath.row == 1){
        setViewController * log = [[setViewController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
        
    }else{
        
        aboutViewController * log = [[aboutViewController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
        
    }
    self.tabBarController.tabBar.hidden =YES;
}
- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden =NO;
    
}
//代理方法, 由tableView调用, 想让界面返回数据行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSArray *titles = @[@"立即登录", @"设置", @"关于"];
    NSArray *images = @[@"p_notLogin@2x.png", @"setting@2x.png", @"copyright@2x.png"];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    UIImageView * im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"p_arrow.png"]];
    im.frame = CGRectMake(280*ScreenWidth, 20*ScreenHeight, 23/4*ScreenWidth, 39/4*ScreenHeight);
    [cell addSubview:im];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    UIImageView *ima = [[UIImageView alloc]initWithFrame:CGRectMake(10*ScreenWidth, 49 *ScreenHeight, 300*ScreenWidth, 0.5)];
    ima.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:ima];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50*ScreenHeight;
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
