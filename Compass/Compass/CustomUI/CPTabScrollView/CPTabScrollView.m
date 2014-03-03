//
//  CPTabScrollView.m
//  Compass
//
//  Created by JDG on 14-3-3.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import "CPTabScrollView.h"
#import "CPTabItemView.h"

@interface CPTabScrollView ()
<CPTabItemViewDelegate>

@end

@implementation CPTabScrollView
{
    NSMutableArray *_dataItemViews;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        _dataItemViews = [[NSMutableArray alloc] init];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.itemBlank = 0.f;
    }
    return self;
}

- (CPTabItemView *)getItemViewAtIndex:(CGFloat)index
{
    CPTabItemView *itemView = nil;
    if (_dataItemViews.count > index)
    {
        itemView = [_dataItemViews objectAtIndex:index];
    }
    else
    {
        itemView = [[CPTabItemView alloc] init];
        [_dataItemViews addObject:itemView];
    }
    itemView.delegate = self;
    return itemView;
}

- (void)refreshData
{
    int count = [self.dataSource numbersOfItemForScrollView:self];
    CGFloat xOffset = self.itemBlank;
    CGFloat maxHeight = 0.f;
    for (int i=0;i<count;++i)
    {
        CPTabItem *item = [self.dataSource itemForScrollView:self atIndex:i];
        if (item)
        {
            CPTabItemView *itemView = [self getItemViewAtIndex:i];
            itemView.frame = CGRectMake(xOffset, 0, 0, 0);
            [itemView customlizedWithItem:item];
            [self addSubview:itemView];
            xOffset += itemView.frame.size.width+self.itemBlank;
            maxHeight = MAX(itemView.frame.size.height,maxHeight);
        }
    }
    self.contentSize = CGSizeMake(xOffset, maxHeight);
}

#pragma mark - CPTabItemViewDelegate

- (void)tabItemView:(CPTabItemView *)itemView didChangeSelection:(BOOL)isSelected
{
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(scrollViewDidSelectedItem:atIndex:)])
    {
        [self.dataSource scrollViewDidSelectedItem:itemView.bindItem atIndex:[_dataItemViews indexOfObjectIdenticalTo:itemView]];
    }
    
}

@end
