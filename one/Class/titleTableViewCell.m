//
//  titleTableViewCell.m
//  NewOne
//
//  Created by 蕾 on 15/10/11.
//  Copyright © 2015年 丛蕾. All rights reserved.
//

#import "titleTableViewCell.h"
@interface titleTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
@implementation titleTableViewCell

- (void)setContent:(NSString *)content{
    
    _label.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-20, 20);
    _label.text = content;
    [_label sizeToFit];
    
}
- (void)awakeFromNib {
    // Initialization code
   
 
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
