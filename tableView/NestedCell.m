
//
//  NestedCell.m
//  tableView
//
//  Created by WJ on 16/6/22.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "NestedCell.h"

@interface NestedCell ()

// 左侧👍imageview
@property (weak, nonatomic) IBOutlet UIImageView *my_iamgeView;
// 搭配的具体食物名称
@property (weak, nonatomic) IBOutlet UILabel *main_text;
// 份数
@property (weak, nonatomic) IBOutlet UILabel *count_label;

@end


@implementation NestedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        // 初始化时加载xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NestedCell class]) owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count > 0){
            // 加载nib
            self = [arrayOfViews objectAtIndex:0];
        }
    }
    return self;
}

- (void)setCellInfo
{
    [self clearData];
    self.my_iamgeView.image = [UIImage imageNamed:@"icon_recommend_dish"];
    self.main_text.text = @"庄园沙拉";
    self.count_label.text = @"1份";
}

- (void)clearData{
    self.my_iamgeView.image = nil;
    self.main_text.text = nil;
    self.count_label.text = nil;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
