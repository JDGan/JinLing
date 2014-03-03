//
//  CPTabItem.h
//  Compass
//
//  Created by JDG on 14-3-3.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPTabItem : NSObject

// 选中背底图片路径
@property (nonatomic , copy) NSString *selectedBGImagePath;
// 未选中背底图片路径
@property (nonatomic , copy) NSString *selectedFrameImagePath;
// 选中图片框路径
@property (nonatomic , copy) NSString *deselectedBGImagePath;
// 未选中图片框路径
@property (nonatomic , copy) NSString *deselectedFrameImagePath;
// 选中时item的大小,默认由背底图图片大小自动匹配
@property (nonatomic , assign) CGSize selectedItemSize;
// 未选中时item的大小, 默认为跟选中item大小相同
@property (nonatomic , assign) CGSize deselectedItemSize;

@end
