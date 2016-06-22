//
//  TableViewCell.h
//  tableView
//
//  Created by WJ on 16/6/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLICKCELLBLOCK)(NSIndexPath *indexPath);

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong)CLICKCELLBLOCK block;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
