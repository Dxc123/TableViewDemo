//
//  TestCustomHeaderView.m
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "TestCustomHeaderView.h"
@interface TestCustomHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation TestCustomHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
          [self setupSubViews];
    }
    return self;

}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView * backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor lightGrayColor];
        self.backgroundView = backgroundView;
       
        [self setupSubViews];
        
    }
    return self;
}

- (void)setupSubViews
{
    // titleLabel
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 180, self.bounds.size.height)];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor blackColor];
   
    _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width-30, 10, 15, 15) ];
    [self addSubview:_imgV];

    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    
  
}


-(void)tapClick:(UITapGestureRecognizer *)tap{
    
    if (self.SectionclickedBlock) {
        
        self.SectionclickedBlock(tap.view.tag);
    }
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}

- (void)setImgStr:(NSString *)imgStr
{
    _imgStr = imgStr;
    
    _imgV.image = [UIImage imageNamed:imgStr];;
}

-(void)setIndex:(NSUInteger)index{
    if (!_index) {
        self.tag = index;
        
    }
    
    //NSLog(@"index = %lu",(unsigned long)index);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
