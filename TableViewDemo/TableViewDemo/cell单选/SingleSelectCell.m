//
//  TableViewCell1.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2019/10/27.
//  Copyright © 2019 CJKT. All rights reserved.
//

#import "SingleSelectCell.h"

@interface SingleSelectCell ()


@end
@implementation SingleSelectCell

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
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(200, 10, 20, 20)];
    self.imgV.image = [UIImage imageNamed:@""];
    self.imgV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.imgV];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.imgV.image = [UIImage imageNamed:@"CheckBox_select"];
    }else{
         self.imgV.image = [UIImage imageNamed:@"CheckBox_unselect"];
    }
    // Configure the view for the selected state
}

@end
