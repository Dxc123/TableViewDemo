//
//  ViewController.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "Test1ViewController.h"
#import "Test2ViewController.h"
#import "Test3ViewController.h"
@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UITableViewDemo演示";
    // 创建tableView
    [self setupTableView];
}

// 创建tableView
- (void)setupTableView
{

     _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *tempStr = nil;
    switch (indexPath.row) {
        case 0:
            tempStr = @"cell折叠(默认关闭)";
            break;
        case 1:
            tempStr = @"单/多Section单选";
            break;
        case 2:
            tempStr = @"单/多Section多选";
            break;
        case 3:
            tempStr = @"多Section多选(分组内单选)";
            break;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld (%@)",indexPath.row, tempStr];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    TestViewController *testVc = nil;
    
    
    if (indexPath.row == 0) {
        TestViewController *vc = [TestViewController new];
        testVc.title = cell.textLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1){
        Test1ViewController *vc = [Test1ViewController new];
        testVc.title = cell.textLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2){
        Test2ViewController *vc = [Test2ViewController new];
        testVc.title = cell.textLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3){
        Test3ViewController *vc = [Test3ViewController new];
        testVc.title = cell.textLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }

   
}

@end
