
//  setViewController.m
//  onedemo
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "setViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width/320
#define ScreenHeight [UIScreen mainScreen].bounds.size.height/568
@interface setViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    UITableView * _tableView;
    NSMutableArray *_title;
    UIWindow * _currentWindow;
    UISwitch *_sh;

}
@end

@implementation setViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {self.automaticallyAdjustsScrollViewInsets = NO;}
    _dataArray = [[NSMutableArray alloc] init];

    NSMutableArray *array1 = [[NSMutableArray alloc] initWithArray:@[@"夜间模式切换"]];

    NSMutableArray *array2 = [[NSMutableArray alloc] initWithArray:@[@"清除缓存"]];
    
    NSMutableArray *array3 = [[NSMutableArray alloc] initWithArray:@[@"去评分",@"反馈",@"用户协议",@"版本号"]];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [_dataArray addObject:array1];
    [_dataArray addObject:array2];
    [_dataArray addObject:array3];
    _title =  [[NSMutableArray alloc] initWithArray:@[@"浏览设置",@"缓存设置",@"更多"]];
    
    //<2>创建表格式图显示
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 62, 320*ScreenWidth, 568*ScreenHeight) style:UITableViewStyleGrouped];
    //别忘了遵守协议
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.bounces = NO;

    
    _sh= [[UISwitch alloc] initWithFrame:CGRectMake(254*ScreenWidth, 108, 0, 0)];
    [self.view addSubview:_sh];
    [_sh addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
 
    _currentWindow = [UIApplication sharedApplication].keyWindow;
    _currentWindow.backgroundColor = [UIColor blackColor];
}



//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _title.count;
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
       cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    
    return cell;
}
//title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
{
    return _title[section];
}
//高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
    
}
    //开关控件的事件处理方法
-(void)switchChange:(UISwitch *)sh
{
    if (_sh.on == YES) {
       
        _currentWindow.alpha = 0.5;
     
    }else{
        _currentWindow.alpha = 1;
    }
    
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
