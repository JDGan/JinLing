//
//  Predefination.h
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-22.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#ifndef CompassDemo_Predefination_h
#define CompassDemo_Predefination_h

// 系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//主屏幕尺寸
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_HEIGHT  SCREEN_BOUNDS.size.width
#define SCREEN_WIDTH SCREEN_BOUNDS.size.height
#define STATUS_BAR_HEIGHT 20.f
#define NAVIBAR_HEIGHT 44.f

//自定义导航条高度
#define STATUS_BAR_HEIGHT 20.f
#define STANDARD_BAR_HEIGHT NAVIBAR_HEIGHT
#define TABBAR_HEIGHT 49.f

// 适配IOS7以下的导航条偏移
#define NAVIGATION_YOFFSET_ADJUSTMENT ((IOS_VERSION >= 7.0f)?STATUS_BAR_HEIGHT + NAVIBAR_HEIGHT:0)
#define STATUSBAR_YOFFSET_ADJUSTMENT ((IOS_VERSION >= 7.0f)?0:-STATUS_BAR_HEIGHT)

#endif
