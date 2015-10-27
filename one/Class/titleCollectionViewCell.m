//
//  titleCollectionViewCell.m
//  NewOne
//
//  Created by 蕾 on 15/9/27.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import "titleCollectionViewCell.h"
#import "UIKit+AFNetworking.h"
#import "titleTableViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width/320.0
#define ScreenHeight [UIScreen mainScreen].bounds.size.height/568.0

@interface titleCollectionViewCell()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *strContMarketTime;
@property (weak, nonatomic) IBOutlet UILabel *strContTitle;
@property (weak, nonatomic) IBOutlet UILabel *strContAuthor;
@property (weak, nonatomic) IBOutlet UILabel *strContAuthorIntroduce;
@property (weak, nonatomic) IBOutlet UIButton *strPraiseNumber;
@property (weak, nonatomic) IBOutlet UILabel *strAuthor;
@property (weak, nonatomic) IBOutlet UILabel *sAuth;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *follerView;
@property (nonatomic,strong)NSArray * dataArray;


@end
@implementation titleCollectionViewCell

- (void)setModel:(titleModel *)model{
    
    _model = model;
    [self creatScrollView];
    
}
- (void)creatScrollView{
    _headerView.frame = CGRectMake(0, 0, 320*ScreenWidth, 100*ScreenHeight);
     [self setScrollerView];
//    _follerView.frame = CGRectMake(0, 0, 320*ScreenWidth, 120*ScreenHeight+_sAuth.frame.size.height);

    _tableView.frame = CGRectMake(0, 0, ScreenWidth*320, ScreenHeight*568);
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _follerView;
    NSString *str =  _model.strContent;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dataArray = [NSArray array];
    _dataArray = [str componentsSeparatedByString:@"<br>"];
    [_tableView  registerNib:[UINib nibWithNibName:@"titleTableViewCell" bundle:nil]forCellReuseIdentifier:@"cell"];
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    titleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.content = _dataArray[indexPath.row];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeMake(320*ScreenWidth, CGFLOAT_MAX);
    //UIlabel控件上设置的字体号,一定要与动态计算字体号统一
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    size = [_dataArray[indexPath.row] boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size.height;
}

- (void)setScrollerView{
    

    _strContMarketTime.frame = CGRectMake(10, 5*ScreenHeight, 150*ScreenWidth, 20*ScreenHeight);
    _strContMarketTime.text = _model.strContMarketTime;
    
    _strContTitle.frame = CGRectMake(10, 30*ScreenHeight, 300*ScreenWidth, 40*ScreenHeight);
    _strContTitle.text = _model.strContTitle;
    
    _strContAuthor.frame = CGRectMake(10, (30+40+5)*ScreenHeight, 300*ScreenWidth, 20*ScreenHeight);
    _strContAuthor.text = _model.strContAuthor;

    _strContAuthorIntroduce.frame = CGRectMake(10,10*ScreenHeight, 300*ScreenWidth, 20*ScreenHeight);
    _strContAuthorIntroduce.text = _model.strContAuthorIntroduce;
    
    _strPraiseNumber.frame = CGRectMake((320-60+5)*ScreenWidth, 40*ScreenHeight, 60*ScreenWidth, 25*ScreenHeight);
    [_strPraiseNumber setTitle:_model.strPraiseNumber forState:UIControlStateSelected];
    [_strPraiseNumber setTitle:[NSString stringWithFormat:@"  %d",_model.strPraiseNumber.intValue-1] forState:UIControlStateNormal];
    [_strPraiseNumber setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _strPraiseNumber.titleLabel.font = [UIFont systemFontOfSize:11];
    [_strPraiseNumber addTarget:self action:@selector(zan:) forControlEvents:UIControlEventTouchUpInside];
    UIImage * img= [UIImage imageNamed:@"home_likeBg"];
    img = [img stretchableImageWithLeftCapWidth:59 topCapHeight:0];
    
    [_strPraiseNumber setBackgroundImage:img forState:UIControlStateNormal];
    
    
    _imageView.frame = CGRectMake(10,80*ScreenHeight, 300*ScreenWidth, 0.5);
    
    _strAuthor.frame = CGRectMake(10,100*ScreenHeight, 300*ScreenWidth, 20*ScreenHeight);
    
    _strAuthor.text = _model.strContAuthor;
    _strAuthor.textColor = [UIColor blackColor];
    
    _sAuth.frame = CGRectMake(10, 130*ScreenHeight, 300*ScreenWidth, 20*ScreenHeight);
    _sAuth.text = _model.sAuth;
    [_sAuth sizeToFit];
    _follerView.frame = CGRectMake(0, 0, 320*ScreenWidth, 300*ScreenHeight+_sAuth.frame.size.height);


}
- (void)zan:(UIButton *)button{
    
    if (button.selected == NO) {
        button.selected  = YES;
        
    }else{
        
        button.selected = NO;
    }
    
}

@end
