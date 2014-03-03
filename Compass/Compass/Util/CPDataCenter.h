//
//  CPDataCenter.h
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-23.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

/*数据中心：负责读取车型数据*/

#import <Foundation/Foundation.h>

@interface CPDataCenter : NSObject

+ (CPDataCenter *)center;
//车型系列名称数组
- (NSArray *)carModelNames;
// 加载指定车型的plist文件
- (NSDictionary *)loadPropertiesByCarName:(NSString *)carName;

@end
