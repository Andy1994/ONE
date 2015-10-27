//
//  appListViewController.h
//  NewOne
//
//  Created by 蕾 on 15/9/23.
//  Copyright © 2015年 蕾. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface appListViewController : UIViewController
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UIActivityIndicatorView *aiView;
@property (nonatomic) NSString * cachePath;

//-(UILabel *)addLabelWithFrame:(CGRect)frame
//                        title:(NSString *)title;

@end
