//
//  questCollectionViewCell.m
//  NewOne
//
//  Created by 蕾 on 15/9/27.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import "questCollectionViewCell.h"
#import "UIKit+AFNetworking.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width/320
#define ScreenHeight [UIScreen mainScreen].bounds.size.height/568
@interface questCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *strQuestionMarketTime;
@property (weak, nonatomic) IBOutlet UIImageView *questImage;
@property (weak, nonatomic) IBOutlet UIImageView *ansImage;
@property (weak, nonatomic) IBOutlet UILabel *strQuestionTitle;
@property (weak, nonatomic) IBOutlet UILabel *strQuestionContent;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *strAnswerTitle;
@property (weak, nonatomic) IBOutlet UILabel *strAnswerContent;
@property (weak, nonatomic) IBOutlet UILabel *sEditor;
@property (weak, nonatomic) IBOutlet UIButton *strPraiseNumber;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end
@implementation questCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(questModel *)model{
    
    _model = model;
    [self creatScrollView];
    
}
- (void)creatScrollView{
    _scrollerView.frame = CGRectMake(0, 0, ScreenWidth*320, ScreenHeight*568);
    _scrollerView.backgroundColor = [UIColor whiteColor];
    _scrollerView.userInteractionEnabled = YES;
    [self setScrollerView];
}
- (void)setScrollerView{
    
    
    _strQuestionMarketTime.frame = CGRectMake(10, 5, 150*ScreenWidth, 20);
    _strQuestionMarketTime.text = _model.strQuestionMarketTime;

    
    
    _questImage.frame = CGRectMake(15, 45, 36*ScreenWidth, 36);
    _strQuestionTitle.frame = CGRectMake(70, 45, 240*ScreenWidth, 20);
    _strQuestionTitle.text = _model.strQuestionTitle;
    [_strQuestionTitle sizeToFit];

    
    
    _strQuestionContent.frame = CGRectMake(10,45+36+20, 300*ScreenWidth, 20);
    _strQuestionContent.text = _model.strQuestionContent;
    _strQuestionContent.numberOfLines = 0;
    [_strQuestionContent sizeToFit];
    
    _backImage.frame = CGRectMake(10, 45+36+20+_strQuestionContent.frame.size.height+10 , 300*ScreenWidth, 0.5);

    _ansImage.frame = CGRectMake(15, 45+36+20+_strQuestionContent.frame.size.height+30, 36*ScreenWidth, 36);

    _strAnswerTitle.frame = CGRectMake(70, 45+36+20+_strQuestionContent.frame.size.height+30, 240*ScreenWidth, 20);
    _strAnswerTitle.text = _model.strAnswerTitle;
    [_strAnswerTitle sizeToFit];
    
    
    
    _strAnswerContent .frame = CGRectMake(10, 45+36+20+_strQuestionContent.frame.size.height+30+55, 300*ScreenWidth, 40);
    NSString *str1 =  _model.strAnswerContent;
    
    NSArray *arr1 = [str1 componentsSeparatedByString:@"<br>"];
    NSString * content1 = [arr1 componentsJoinedByString:@"\n  "];
    _strAnswerContent.text = content1;
    [_strAnswerContent sizeToFit];

    
    _sEditor.frame = CGRectMake(10, 45+36+20+_strQuestionContent.frame.size.height+30+55+_strAnswerContent.frame.size.height+30, 300*ScreenWidth, 20);
    _sEditor.text = _model.sEditor;

    _strPraiseNumber.frame = CGRectMake((320-60+5)*ScreenWidth, 45+36+20+_strQuestionContent.frame.size.height+30+55+_strAnswerContent.frame.size.height+30 +30, 60*ScreenWidth, 25);

    [_strPraiseNumber setTitle:_model.strPraiseNumber forState:UIControlStateSelected];
    [_strPraiseNumber setTitle:[NSString stringWithFormat:@"%d",_model.strPraiseNumber.intValue-1] forState:UIControlStateNormal];
    [_strPraiseNumber setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _strPraiseNumber.titleLabel.font = [UIFont systemFontOfSize:11];
    [_strPraiseNumber addTarget:self action:@selector(zan:) forControlEvents:UIControlEventTouchUpInside];
    UIImage * img= [UIImage imageNamed:@"home_likeBg@2x.png"];
    img = [img stretchableImageWithLeftCapWidth:59 topCapHeight:0];
    
    [_strPraiseNumber setBackgroundImage:img forState:UIControlStateNormal];
    
    _scrollerView.contentSize = CGSizeMake(320*ScreenWidth,  64+64+45+36+20+_strQuestionContent.frame.size.height+30+55+_strAnswerContent.frame.size.height+100);
    [self addSubview:_scrollerView];
    
}
- (void)zan:(UIButton *)button{
    
    if (button.selected == NO) {
        button.selected  = YES;
        
    }else{
        
        button.selected = NO;
    }
    
}


@end
