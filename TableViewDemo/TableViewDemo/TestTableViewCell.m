//
//  TestTableViewCell.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "TestTableViewCell.h"
@interface TestTableViewCell ()

@end

@implementation TestTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupCellUI];
        
    }
    return self;
}

-(void)setupCellUI{
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, self.bounds.size.height)];
    _titleLab.font = [UIFont systemFontOfSize:14.f];
    _titleLab.textColor = [UIColor grayColor];
    _titleLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLab ];

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//在cell的select方法中设置选中效果即可实现单选效果
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.accessoryType = selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    // Configure the view for the selected state
}

@end
