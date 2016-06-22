//
//  ViewController.m
//  tableView
//
//  Created by WJ on 16/6/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat headViewH;
}

@property (nonatomic, strong)NSMutableArray *arrData;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *arr_num;

// 记录选中的第几个
@property (nonatomic, assign)NSInteger select_section;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    headViewH = 44;
//    arr_num = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八", nil];
    
    NSArray *arr = @[@"1",@"2",@"3"];
    self.arrData = [NSMutableArray arrayWithArray:arr];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 44;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSArray *)arr_num
{
    if (!_arr_num) {
        _arr_num = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八", nil];
    }
    return _arr_num;
}

// 数据
//- (NSMutableArray *)arrData
//{
//    if (!_arrData) {
//        _arrData = [[NSMutableArray alloc] initWithCapacity:3];
//    }
//    return _arrData;
//}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.block = ^(NSIndexPath *myIndexPath){
        // 在这里写点击内嵌在tableviewcell的事件处理
        
        // indexPath 是最外层tableview
        NSLog(@"%ld**************%ld",indexPath.section,indexPath.row);
        self.select_section = indexPath.section;
        [self.tableView reloadData];
        
        // myIndexPath 是内嵌在里面的tableview
        NSLog(@"点击的是%ld组---%ld行",myIndexPath.section,myIndexPath.row);
        
    };
    
    return cell;
}

#pragma mark UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, headViewH);
    
    // 左边的对号按钮
    UIImageView *iv_check = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, headViewH - 10, headViewH - 10)];
    [headView addSubview:iv_check];
    if (self.select_section == section) {
        iv_check.image = [UIImage imageNamed:@"gou"];
    }else
    {
        iv_check.alpha = 0;
    }
    
    // 中间的label(套餐名)
    UILabel *lb_name = [[UILabel alloc] initWithFrame:CGRectMake(headViewH, 0, 150, headViewH)];
    [headView addSubview:lb_name];
    lb_name.text = [NSString stringWithFormat:@"SET A %@",self.arr_num[section]];
    lb_name.font = [UIFont systemFontOfSize:23.0];
    
    // 套餐价格
    UILabel *lb_price = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 150, headViewH)];
    [headView addSubview:lb_price];
    lb_price.text = @"199.00/套";
    lb_price.textColor = [UIColor redColor];
    lb_price.font = [UIFont systemFontOfSize:16.0];
    
    // 覆盖在headview上面的button，监听点击事件
    UIButton *btn_cover = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_cover.frame = CGRectMake(0, 0, SCREENWIDTH - headViewH, headViewH);
    [headView addSubview:btn_cover];
    btn_cover.tag = section;
    [btn_cover addTarget:self action:@selector(tapCoverButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // 右侧的button
    UIButton *btn_delete = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_delete.frame = CGRectMake(SCREENWIDTH- headViewH, 0, headViewH, headViewH);
    [headView addSubview:btn_delete];
//    btn_delete.backgroundColor = [UIColor redColor];
    btn_delete.tag = section;
    
    [btn_delete addTarget:self action:@selector(tapDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    if (self.arrData.count == 1) {
        btn_delete.alpha = 0;
    }
    
    // 给button设置图片（红色叉号）
    [btn_delete setImage:[UIImage imageNamed:@"delete_x_bg"] forState:UIControlStateNormal];
    btn_delete.adjustsImageWhenHighlighted = NO;
    
    return headView;
}

- (void)tapCoverButton:(UIButton *)button
{
    self.select_section = button.tag;
    [self.tableView reloadData];
}

// 点击headView控件上右上角的叉号调用的方法
- (void)tapDeleteButton:(UIButton *)deleteButton
{
    NSInteger section = deleteButton.tag;
    NSLog(@"dianji di %ld section",section);
    
    [self.arrData removeObjectAtIndex:deleteButton.tag];
    
    [self.tableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return headViewH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44 * 12;
}

@end
