//
//  CPFileManager.h
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-23.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

/*文件中心：负责生成文件夹、plist文件等*/

#import <Foundation/Foundation.h>

@interface CPFileManager : NSObject

+ (CPFileManager *)manager;

+ (NSString *)documentPath;
// 从car.plist文件中读取车型名称
+ (NSArray *)loadModels;
// 创建各车型文件夹和其目录下的plist文件
- (void)createCarFolders;
// 指定车型的plist文件目录
- (NSString *)plistPathOfCar:(NSString *)carName;

@end
