//
//  thingCollectionViewCell.m
//  NewOne
//
//  Created by 蕾 on 15/9/27.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import "thingCollectionViewCell.h"
#import "UIKit+AFNetworking.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface thingCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *strTm;
@property (weak, nonatomic) IBOutlet UIImageView *strBu;
@property (weak, nonatomic) IBOutlet UILabel *strTt;
@property (weak, nonatomic) IBOutlet UILabel *strTc;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (strong,nonatomic)UIButton *butt;
@property (nonatomic,strong)UIImageView *ims;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *action;
@end
@implementation thingCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(thingModel *)model{
    
    _model = model;
    [self creatScrollView];
    
}
- (void)creatScrollView{
    _scrollerView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _scrollerView.userInteractionEnabled = YES;
    [self setScrollerView];
}

- (void)setScrollerView{
    
    _strTm.frame = CGRectMake(10, 5*ScreenHeight/568,150*ScreenWidth/320, 20*ScreenHeight/568);
    _strTm.text = _model.strTm;
    
    _action.center = CGPointMake(ScreenWidth/2, 45*ScreenHeight/568+150*ScreenHeight/568);
    [_action startAnimating];
    _strBu.frame = CGRectMake(10, 45*ScreenHeight/568, 300*ScreenWidth/320, 300*ScreenHeight/568);
    [_strBu setImage:[UIImage imageNamed:@""]];
    [_strBu setImageWithURL:[NSURL URLWithString:_model.strBu]];
    _strBu.userInteractionEnabled = YES;
 
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dealTap)];
    [_strBu addGestureRecognizer:tap];
    
    
    _strTt.frame = CGRectMake(10, (5+300+50)*ScreenHeight/568, 300*ScreenWidth/320, 30*ScreenHeight/568);
    _strTt.text = _model.strTt;
    
    
    _strTc.frame = CGRectMake(10, (5+300+50+50)*ScreenHeight/568, 300*ScreenWidth/320,50*ScreenHeight/568);
    _strTc.text = _model.strTc;
    [_strTc sizeToFit];
  
    
    
    _scrollerView.contentSize = CGSizeMake(ScreenWidth, (5+300+50+50+_strTc.frame.size.height+128) *ScreenHeight/568);
    [self addSubview:_scrollerView];
    
}
- (void)dealTap{
    
    
    UIWindow * currentWindow = [UIApplication sharedApplication].keyWindow;
    
    _butt = [UIButton buttonWithType:UIButtonTypeCustom];
    _butt.backgroundColor = [UIColor grayColor];
    _butt.alpha = 0.7;
    _butt.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _ims = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, 0, 0)];
    
    [_ims setImageWithURL:[NSURL URLWithString:_model.strBu]];
    
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


@end
