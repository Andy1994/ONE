//
//  questCollectionViewCell.h
//  NewOne
//
//  Created by 蕾 on 15/9/27.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "questModel.h"
#import "UICollectionViewCell+app.h"
@interface questCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)questModel *model;
@end
