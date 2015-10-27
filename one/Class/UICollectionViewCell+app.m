//
//  UICollectionViewCell+app.m
//  NewOne
//
//  Created by 蕾 on 15/9/23.
//  Copyright © 2015年 蕾. All rights reserved.
//

#import "UICollectionViewCell+app.h"

@implementation UICollectionViewCell (app)



+(id)cellWithTableView:(UICollectionView *)tableView andIndexPath:(NSIndexPath *)indexpath
{
    NSString * className = NSStringFromClass([self class]);
    
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellWithReuseIdentifier:className];
    return [tableView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexpath];
    
}


@end
