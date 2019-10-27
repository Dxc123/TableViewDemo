//
//  CustomMultipleSelectViewController.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2019/10/27.
//  Copyright © 2019 CJKT. All rights reserved.
//

#import "CustomMultipleSelectViewController.h"
#import "MultipleSelectCell.h"
@interface CustomMultipleSelectViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray * selectedArr;
@end

@implementation CustomMultipleSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义多选";
    self.selectedArr = [NSMutableArray array];
    [self setupTableView];
}

// 创建tableView
- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
     [_tableView registerClass:[MultipleSelectCell class] forCellReuseIdentifier:@"MultipleSelectCell"];
    [self.view addSubview:_tableView];
    _tableView.allowsMultipleSelection = YES;//多选
    _tableView.tableFooterView = [UIView new];;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultipleSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MultipleSelectCell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.titleLab.text = [NSString stringWithFormat:@"Section:%ld,Row:%ld",indexPath.section,(long)indexPath.row];
    
    cell.selectBlock = ^(BOOL isClick) {
        if (isClick) {
        [self.selectedArr addObject:indexPath ];
        NSLog(@"加入selectedArr=%ld",self.selectedArr.count);
        }else{
        [self.selectedArr removeObject:indexPath ];
        NSLog(@"取消selectedArr=%ld",self.selectedArr.count);
        }
       
    };
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"section:%ld",(long)section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
//    NSLog(@"选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
//   [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
//   [self.selectedArr addObject:indexPath ];
//    NSLog(@"加入selectedArr=%ld",self.selectedArr.count);

}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//     NSLog(@"取消选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self.selectedArr removeObject:indexPath ];
//    NSLog(@"取消selectedArr=%ld",self.selectedArr.count);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
