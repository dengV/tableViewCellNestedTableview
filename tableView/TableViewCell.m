//
//  TableViewCell.m
//  tableView
//
//  Created by WJ on 16/6/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "TableViewCell.h"
#import "NestedCell.h"

@interface TableViewCell ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat headViewH; // head的高度
}

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    headViewH  = 44;

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initTableView];
    }
    return self;
}

// 初始化tableview
- (void)initTableView{
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44 * 12) style:UITableViewStyleGrouped];
        [self.contentView addSubview:self.tableView];
        
        // 去掉下划线
        self.tableView.separatorColor = [UIColor clearColor];
        
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.scrollEnabled = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
}

# pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NestedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NestedCell class])];
    if (!cell) {
        cell = [[NestedCell alloc] init];
    }

    [cell setCellInfo];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// 设置headview
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, headViewH)];
    
    UILabel *lb_category = [[UILabel alloc] initWithFrame:CGRectMake(10, 2,200, 30)];
    [headView addSubview:lb_category];
    lb_category.text = @"固定搭配";
    if (section == 0) {
        headView.backgroundColor = [UIColor greenColor];
    }else
    {
        headView.backgroundColor = [UIColor lightGrayColor];
    }
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.block) {
        self.block(indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return headViewH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}


@end
