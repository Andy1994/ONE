//
//  questModel.h
//  onedemo
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface questModel :NSObject
@property (nonatomic,copy) NSString *strQuestionContent;
@property (nonatomic,copy) NSString *strQuestionMarketTime;
@property (nonatomic,copy) NSString *strQuestionId;
@property (nonatomic,copy) NSString *sEditor;
@property (nonatomic,copy) NSString *strPraiseNumber;
@property (nonatomic,copy) NSString *strLastUpdateDate;
@property (nonatomic,copy) NSString *entQNCmt;
@property (nonatomic,copy) NSString *strDayDiffer;
@property (nonatomic,copy) NSString *sWebLk;
@property (nonatomic,copy) NSString *strAnswerTitle;
@property (nonatomic,copy) NSString *strAnswerContent;
@property (nonatomic,copy) NSString *strQuestionTitle;
@end

