//
//  TableViewCell2.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2019/10/27.
//  Copyright © 2019 CJKT. All rights reserved.
//

#import "MultipleSelectCell.h"

@implementation MultipleSelectCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCellUI];
    }
    return self;
}
-(void)creatCellUI{
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.titleLab.font = [UIFont systemFontOfSize:14.f];
    self.titleLab.text = @"lab";
    self.titleLab.textColor = [UIColor grayColor];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLab];
    
//    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(200, 10, 20, 20)];
//    self.imgV.image = [UIImage imageNamed:@""];
//    self.imgV.backgroundColor = [UIColor clearColor];
//    [self.contentView addSubview:self.imgV];
    
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.frame =CGRectMake(200, 5, 30, 30);
    [self.selectBtn setImage:[UIImage imageNamed:@"CheckBox_unselect"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"CheckBox_select"] forState:UIControlStateSelected];
    [self.selectBtn addTarget:self action:@selector(selectBtnCliceked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.selectBtn];
}

-(void)selectBtnCliceked:(UIButton *)sender{
       sender.selected = !sender.selected;
       if (sender.selected) {
            NSLog(@"选择");
           self.selectBtn.selected = YES;
       }else {
            NSLog(@"取消");
           self.selectBtn.selected = NO;
       }
        if (self.selectBlock) {
             NSLog(@"选择");
            self.selectBlock(sender.selected);
        }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//     Configure the view for the selected state
    if (selected) {
        self.selectBtn.selected = YES;
    }else{
         self.selectBtn.selected = NO;
    }
}

@end
