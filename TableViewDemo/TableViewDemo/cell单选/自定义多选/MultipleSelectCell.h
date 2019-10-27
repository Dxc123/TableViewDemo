//
//  TableViewCell2.h
//  TableViewDemo
//
//  Created by Dxc_iOS on 2019/10/27.
//  Copyright © 2019 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectBlock)(BOOL isClick);
@interface MultipleSelectCell : UITableViewCell
@property (nonatomic, copy) SelectBlock selectBlock;

@property  (nonatomic, strong) UILabel *titleLab;

@property  (nonatomic, strong) UIButton *selectBtn;
@end

NS_ASSUME_NONNULL_END
