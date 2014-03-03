//
//  CPTabScrollView.h
//  Compass
//
//  Created by JDG on 14-3-3.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTabItem.h"

@protocol JDGTabScrollDatasource;
@interface CPTabScrollView : UIScrollView

@property (nonatomic ,weak) id <JDGTabScrollDatasource> dataSource;
// 元素之间的距离，默认为0.f
@property (nonatomic ,assign) CGFloat itemBlank;

- (void)refreshData;

@end

@protocol JDGTabScrollDatasource <NSObject>
@required
- (NSInteger)numbersOfItemForScrollView:(CPTabScrollView *)scrollView;

- (CPTabItem *)itemForScrollView:(CPTabScrollView *)scrollView atIndex:(NSInteger)index;
@optional

- (void)scrollViewDidSelectedItem:(CPTabItem *)item atIndex:(NSInteger)index;

@end
