//
//  TestViewController.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "TestViewController.h"
#import "TestCustomHeaderView.h"

@interface TestViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * isOpenArray;//标记数组(0：闭合 ，i1：展开)
@property (nonatomic, strong) NSMutableDictionary *openSectionDict; // 标记字典(0：闭合 ，i1：展开)
@end

@implementation TestViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"cell折叠(默认关闭)";
    self.isOpenArray = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0", nil];// 初始化标记数组
    self.openSectionDict = [[NSMutableDictionary alloc] init]; // 初始化标记字典
    [self setupTableView];
}

// 创建tableView
- (void)setupTableView
{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    if ([self.isOpenArray[section] isEqualToString:@"1"]) {//根据记录的展开状态设置row的数量
    //        DataModel *model = self.baseModel.data[section];
    //        return model.goods.count;
    //
    //    }else{
    //        return 0;
    //    }
    if ([[self.openSectionDict valueForKey:[NSString stringWithFormat:@"%ld",section]] integerValue] == 1){//根据记录的展开状态设置row的数量
       
        return 5;
    } else {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld ",indexPath.row ];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TestCustomHeaderView *headerView = [[TestCustomHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45.f)];
   
    headerView.title = [NSString stringWithFormat:@"headerView %ld",section];
    //            if ([self.isOpenArray[indexPath.section] isEqualToString:@"0"]) {//根据记录的展开状态
    //                 headerView.imgStr = @"upload_choice_downarrow"; // 三角形小图片
    //            }else{
    //               headerView.imgStr = @"upload_choice_uparrow";
    //            }
    if ([[self.openSectionDict valueForKey:[NSString stringWithFormat:@"%ld", section]] integerValue] == 0) {
        headerView.imgStr = @"home_choice_downarrow"; // 三角形小图片
    } else {
        headerView.imgStr = @"home_choice_uparrow";
    }
    headerView.index = section;
    
    headerView.SectionclickedBlock = ^(NSUInteger index) {
        NSLog(@"点击了%lu个section",(unsigned long)index);
        //              数组标记
        //            if ([_isOpenArray[index] isEqualToString:@"0"]) {
        //                //关闭 => 展开
        //                [_isOpenArray removeObjectAtIndex:index];
        //                [_isOpenArray insertObject:@"1" atIndex:index];
        //            }else{
        //                //展开 => 关闭
        //                [_isOpenArray removeObjectAtIndex:index];
        //                [_isOpenArray insertObject:@"0" atIndex:index];
        //
        //            }
        //              字典标记
        NSString *key = [NSString stringWithFormat:@"%ld", index ];
        // 给展开标识赋值
        if ([[self.openSectionDict objectForKey:key] integerValue] == 0) {
            [self.openSectionDict setObject:@"1" forKey:key];
        } else {
            [self.openSectionDict setObject:@"0" forKey:key];
        }
        
        //             防止会刷新其他地方，导致出错
        [self.tableView performBatchUpdates:^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone];
        } completion:nil];
        
    };
    return headerView;
    
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
