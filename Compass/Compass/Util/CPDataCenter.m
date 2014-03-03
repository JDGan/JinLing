//
//  CPDataCenter.m
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-23.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#import "CPDataCenter.h"
#import "CPFileManager.h"

@interface CPDataCenter()
{
    CPFileManager *_fileMgr;
}

@end

@implementation CPDataCenter

- (id)init
{
    self = [super init];
    if (self) {
        _fileMgr = [CPFileManager manager];
    }
    return self;
}

+ (CPDataCenter *)center
{
    static CPDataCenter *instance = nil;
    if (!instance) {
        instance = [[CPDataCenter alloc] init];
        
    }
    return instance;
}
//读取plist车型文件
- (NSArray *)loadCarModelsFromMainPlist
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"];
    NSArray *cars = [NSArray arrayWithContentsOfFile:plistPath];
    return cars;
}

- (NSArray *)carModelNames
{
    NSArray *plistArray = [self loadCarModelsFromMainPlist];
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (NSDictionary *modelDic in plistArray) {
        [names addObject:[modelDic objectForKey:@"car_name"]];
    }
    return names;
}

// 指定车型的plist文件目录
- (NSString *)plistPathByCarName:(NSString *)carName
{
    
    NSArray *carModels = [self loadCarModelsFromMainPlist];
    // 从cars.plist找到该车型的资源文件目录
    for (NSDictionary *model in carModels) {
        if ([[model objectForKey:@"car_name"] isEqualToString:carName]) {
            // 是否是默认车型
            NSString *documentPath =[model objectForKey:@"document_path"];
            if (documentPath && documentPath.length) {
                // document文件夹中的路径
                [[CPFileManager manager] plistPathOfCar:carName];
            }
            else{
                // 从资源文件中的路径
                return [[NSBundle mainBundle] pathForResource:carName ofType:@"plist"];
            }
        }
    }
    return nil;
}

- (NSDictionary *)loadPropertiesByCarName:(NSString *)carName
{
    NSString *plistFile = [self plistPathByCarName:carName];
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:plistFile];
    return plistDic;
}


@end
