//
//  mianCollectionViewCell.m
//  NewOne
//
//  Created by 蕾 on 15/9/27.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import "mianCollectionViewCell.h"
#import "UIKit+AFNetworking.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface mianCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *strHpTitle;
@property (weak, nonatomic) IBOutlet UIImageView *strOriginalImgUrl;
@property (weak, nonatomic) IBOutlet UILabel *strAuthor;
@property (weak, nonatomic) IBOutlet UIImageView *textImageView;
@property (weak, nonatomic) IBOutlet UILabel *strContent;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timeImageVIew;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (strong,nonatomic)UIButton *butt;
@property (nonatomic,strong)UIImageView *ims;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *action;
@end
@implementation mianCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(MainModel *)model{
    
    _model = model;
    [self creatScrollView];
    [self setScrollerView];
}
- (void)creatScrollView{
    
    _scrollerView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _scrollerView.userInteractionEnabled = YES;
    
}

- (void)setScrollerView{
    
    _strHpTitle.frame = CGRectMake(5, 10, 180.0/320*ScreenWidth, 10.0/320*ScreenHeight);
    _strHpTitle.text = _model.strHpTitle;
    
    _action.center = CGPointMake(ScreenWidth/2, 45*ScreenHeight/568+100*ScreenHeight/568);
    [_action startAnimating];
    _strOriginalImgUrl.frame = CGRectMake(10, 30, ScreenWidth-20, 220.0/568*ScreenHeight);
    [_strOriginalImgUrl setImage:[UIImage imageNamed:@""]];
    [_strOriginalImgUrl setImageWithURL:[NSURL URLWithString:_model.strOriginalImgUrl]];
    _strOriginalImgUrl.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dealTap)];
    [_strOriginalImgUrl addGestureRecognizer:tap];
    
    
    _strAuthor.frame = CGRectMake(ScreenWidth - 200,(30+220.0)/568*ScreenHeight  , 190, 60.0/568*ScreenHeight);
    _strAuthor.text = _model.strAuthor;
    
    
    [self label];
    
    
    _timeImageVIew.frame = CGRectMake(10, 320.0/568*ScreenHeight, 80, 100);
    [_timeImageVIew addSubview:_dayLabel];
    [_timeImageVIew addSubview:_yearLabel];
    _dayLabel.frame = CGRectMake(0, 0, 80, 20);
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"MM";
    NSString *dateStr = [df stringFromDate:[NSDate date]];
    
    _dayLabel.text = dateStr;
  
    NSDateFormatter *df1 = [[NSDateFormatter alloc] init];
    df1.dateFormat = @"yyyy";
    NSString *dateStr1 = [df1 stringFromDate:[NSDate date]];
    _yearLabel.frame = CGRectMake(0, 20, 80, 20);
    _yearLabel.text = [NSString stringWithFormat:@"%d-%@",arc4random()%30+1,dateStr1];
    
}

- (void)dealTap{
    
    
    UIWindow * currentWindow = [UIApplication sharedApplication].keyWindow;
    
    _butt = [UIButton buttonWithType:UIButtonTypeCustom];
    _butt.backgroundColor = [UIColor grayColor];
    _butt.alpha = 0.7;
    _butt.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _ims = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 0, 0)];
    
    [_ims setImageWithURL:[NSURL URLWithString:_model.strOriginalImgUrl]];
  
    [_butt addTarget:self action:@selector(deap) forControlEvents:UIControlEventTouchUpInside];
    [currentWindow addSubview:_butt];
    [currentWindow addSubview:_ims];
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _ims.frame = CGRectMake(0, ScreenHeight/2 - (ScreenWidth-50)/2.0, ScreenWidth, ScreenWidth-50);
        
    } completion:^(BOOL finished) {
        
        
        
    }];
    
    
    
    
}
- (void)deap{
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _ims.frame = CGRectMake(ScreenWidth/2, ScreenHeight/2, 0, 0);
    } completion:^(BOOL finished) {
        
        [_butt removeFromSuperview];
        [_ims removeFromSuperview];
    }];
    
    
}

- (void)zan:(UIButton *)button{
    
    if (button.selected == NO) {
        button.selected  = YES;
        
    }else{
        
        button.selected = NO;
    }
    
}
- (void)label{
    
    
//    _textImageView.frame = CGRectMake(ScreenWidth*100.0/320, 350.0/568*ScreenHeight, 180.0/320*ScreenWidth, 50.0/568*ScreenHeight);
    UIImage * img= [UIImage imageNamed:@"contBack@2x.png"];
    img  = [img resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 10, 10)];
    
    _textImageView.image =img;
    _strContent.frame = CGRectMake(15.0/320*ScreenWidth , 10.0/568*ScreenHeight, 160.0/320*ScreenWidth, 100.0/568*ScreenHeight);
    [_textImageView addSubview:_strContent];
    _strContent.text = _model.strContent;
    _strContent.numberOfLines = 0;
    if (ScreenWidth > 320.0) {
        
        _strContent.font = [UIFont systemFontOfSize:14];
        
    }else{
        _strContent.font = [UIFont systemFontOfSize:12];
    }
    
    [_strContent sizeToFit];
     _textImageView.frame = CGRectMake(ScreenWidth*100.0/320, 320.0/568*ScreenHeight, 180.0/320*ScreenWidth, (10 + _strContent.frame.size.height +10)/568.0*ScreenHeight);
    
    
    
    _zanButton.frame = CGRectMake((320-60+5)*ScreenWidth/320.0, (20+350.0)/568.0*ScreenHeight +(10 + _strContent.frame.size.height)/568.0*ScreenHeight , 60, 25);
    [_zanButton setTitle:_model.strPn forState:UIControlStateSelected];
    [_zanButton setTitle:[NSString stringWithFormat:@"%d",_model.strPn.intValue-1] forState:UIControlStateNormal];
    [_zanButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _zanButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [_zanButton addTarget:self action:@selector(zan:) forControlEvents:UIControlEventTouchUpInside];
    UIImage * Bimg= [UIImage imageNamed:@"home_likeBg@2x.png"];
    Bimg = [Bimg stretchableImageWithLeftCapWidth:59 topCapHeight:0];
    
    [_zanButton setBackgroundImage:Bimg forState:UIControlStateNormal];
    
    _scrollerView.contentSize = CGSizeMake(ScreenWidth, 10+350.0/568*ScreenHeight +(10 + _strContent.frame.size.height)/568.0*ScreenHeight +200 );
}


@end
