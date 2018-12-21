//
//  TestCustomHeaderView.h
//  TableViewDemo
//
//  Created by Dxc_iOS on 2018/12/13.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestCustomHeaderView : UITableViewHeaderFooterView
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgStr;
@property (nonatomic, assign)NSUInteger index;
@property(nonatomic, copy) void(^SectionclickedBlock)(NSUInteger index);
@end

NS_ASSUME_NONNULL_END
