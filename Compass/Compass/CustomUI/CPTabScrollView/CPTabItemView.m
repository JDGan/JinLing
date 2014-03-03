//
//  CPTabItemView.m
//  Compass
//
//  Created by JDG on 14-3-3.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import "CPTabItemView.h"
#import "CPTabItem.h"

@implementation CPTabItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _backgroundImageView = [[UIImageView alloc] init];
        
        _imageView = [[UIImageView alloc] init];
        
        _frameImageView = [[UIImageView alloc] init];
        
        [self addSubview:_backgroundImageView];
        
        [self addSubview:_imageView];
        
        [self addSubview:_frameImageView];
        
        self.isSelected = NO;
    }
    return self;
}

- (void)customlizedWithItem:(CPTabItem *)item
{
    self.bindItem = item;
    CGRect frame = self.frame;
    if (self.isSelected)
    {
        _imageView.image = [UIImage imageWithContentsOfFile:item.selectedBGImagePath];
        _frameImageView.image = [UIImage imageWithContentsOfFile:item.selectedFrameImagePath];
        frame.size = item.selectedItemSize;
    }
    else
    {
        _imageView.image = [UIImage imageWithContentsOfFile:item.deselectedBGImagePath];
        _frameImageView.image = [UIImage imageWithContentsOfFile:item.deselectedFrameImagePath];
        frame.size = item.deselectedItemSize;
    }
    self.frame = frame;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    [self customlizedWithItem:self.bindItem];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [super touchesBegan:touches withEvent:event];
    [self setIsSelected:!self.isSelected];    
    if (self.delegate
        && [self.delegate respondsToSelector:@selector(tabItemView:didChangeSelection:)])
    {
        [self.delegate tabItemView:self didChangeSelection:self.isSelected];
    }
}

@end
