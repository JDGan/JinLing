//
//  CPTabItemView.h
//  Compass
//
//  Created by JDG on 14-3-3.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPTabItem;
@protocol CPTabItemViewDelegate;
@interface CPTabItemView : UIView

@property (nonatomic , weak) id <CPTabItemViewDelegate> delegate;
// 背景
@property (nonatomic , readonly) UIImageView *backgroundImageView;
// 内容图片
@property (nonatomic , readonly) UIImageView *imageView;
// 选中框图片
@property (nonatomic , readonly) UIImageView *frameImageView;
// 当前是否被选中
@property (nonatomic , assign) BOOL isSelected;
// 对应item
@property (nonatomic , weak) CPTabItem *bindItem;

- (void)customlizedWithItem:(CPTabItem *)item;

@end

@protocol CPTabItemViewDelegate <NSObject>

- (void)tabItemView:(CPTabItemView *)itemView didChangeSelection:(BOOL)isSelected;

@end