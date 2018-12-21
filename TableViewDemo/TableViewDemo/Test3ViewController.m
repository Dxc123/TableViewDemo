//
//  Test3ViewController.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "Test3ViewController.h"
#import "TestCustomHeaderView.h"
@interface Test3ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *openSectionDict; // 标记字典(0：闭合 ，i1：展开)
@property (nonatomic, strong) NSMutableDictionary *selectedDict;
@end

@implementation Test3ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多Section多选(分组内单选)";
    self.openSectionDict = [[NSMutableDictionary alloc] init]; // 初始化标记字典
    self.selectedDict = [[NSMutableDictionary alloc] init];
    [self setupTableView];
    
//    有默认打开第一个Section
    [self.openSectionDict setObject:@"1" forKey:[NSString stringWithFormat:@"%d", 0]];
//   有默认选择第一个Sectiond第一行 在初始化tableView完成后写
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];

    
}

// 创建tableView
- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];;
//    _tableView.allowsMultipleSelection = YES;//多选
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
   
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[self.openSectionDict valueForKey:[NSString stringWithFormat:@"%ld",section]] integerValue] == 1){//根据记录的展开状态设置row的数量
        
        return 15;
    } else {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TestCustomHeaderView *headerView = [[TestCustomHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45.f)];
    headerView.title = [NSString stringWithFormat:@"headerView %ld",section];
  
    if ([[self.openSectionDict valueForKey:[NSString stringWithFormat:@"%ld", section]] integerValue] == 0) {
        headerView.imgStr = @"home_choice_downarrow"; // 三角形小图片
    } else {
        headerView.imgStr = @"home_choice_uparrow";
    }
    headerView.index = section;
    
    headerView.SectionclickedBlock = ^(NSUInteger index) {
        NSLog(@"点击了%lu个section",(unsigned long)index);
       
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"Section:%ld,Row:%ld",indexPath.section,(long)indexPath.row];
    
    //默认第一段一行选中
//    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section] animated:YES scrollPosition:UITableViewScrollPositionTop];
//    [self tableView:_tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
// 分组内单选：   在选择某一行的方法里遍历每一section里的每一行，初始状态设置为不选中
    for (int row = 0; row<[tableView numberOfRowsInSection:indexPath.section]; row++) {

        NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:indexPath.section];

        UITableViewCell *cell = [tableView cellForRowAtIndexPath:index];

        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSLog(@"选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
    UITableViewCell * celll = [tableView cellForRowAtIndexPath:indexPath];
    celll.accessoryType = UITableViewCellAccessoryCheckmark;
   
   
  
    [self.selectedDict setObject:[NSString stringWithFormat:@"row:%ld",indexPath.row] forKey:[NSString stringWithFormat:@"%ld", indexPath.section]];
    NSLog(@"self.selectedDict  = %@",self.selectedDict);
   
}
    
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//  //  [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
//    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryNone;
//    NSLog(@"取消选择了第 %ld Section 第 %ldRow ",(long)indexPath.row,(long)indexPath.row);
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
