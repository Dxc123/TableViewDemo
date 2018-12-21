//
//  Test1ViewController.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "Test1ViewController.h"
#import "TestTableViewCell.h"
@interface Test1ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic ,strong) NSIndexPath * selectedIndexPath;//单选标记
@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"单/多Section单选";
    [self setupTableView];
}

// 创建tableView
- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"TestTableViewCell"];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
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
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell" forIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titleLab.text = [NSString stringWithFormat:@"Section:%ld,Row:%ld",indexPath.section,(long)indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"section:%ld",(long)section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSLog(@"选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
   
    
// 以下俩行代码和didDeselectRowAtIndexPath合起来 实现的效果 ==  cell里 setSelected:animated:方法效果一样
    TestTableViewCell * cell = (TestTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
   
//    实现一个单选可以回退到原始状态
    if (_selectedIndexPath == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [tableView deselectRowAtIndexPath:_selectedIndexPath animated:YES];
        _selectedIndexPath = nil;
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        _selectedIndexPath = indexPath;
    }

}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
   
     NSLog(@"选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
    TestTableViewCell * cell = (TestTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
   
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
