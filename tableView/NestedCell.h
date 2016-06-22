//
//  NestedCell.h
//  tableView
//
//  Created by WJ on 16/6/22.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NestedCell : UITableViewCell

// 根据传回来的model给cell设置真数据
- (void)setCellInfo:(id)model;

// 设置cell的数据（假数据）
- (void)setCellInfo;

@end
