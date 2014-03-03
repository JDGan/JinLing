//
//  CPFileManager.m
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-23.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#import "CPFileManager.h"
#define NUMBER(num) [NSNumber numberWithInt:num]

@interface CPFileManager()

@property (nonatomic, readonly)NSFileManager *fileMgr;

@end

@implementation CPFileManager

- (id)init
{
    self = [super init];
    if (self) {
        _fileMgr = [NSFileManager defaultManager];
    }
    return self;
}


+ (CPFileManager *)manager
{
    static CPFileManager *instance = nil;
    if (!instance) {
        instance = [[CPFileManager alloc] init];
        
    }
    return instance;
}

+ (NSString *)documentPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

// 指定车型的文件夹目录
+ (NSString *)folderDirOfCar:(NSString *)carName
{
    NSString *folderDir = [NSString stringWithFormat:@"%@/%@", [CPFileManager documentPath], carName];
    return folderDir;
}

// 指定车型的plist文件目录
- (NSString *)plistPathOfCar:(NSString *)carName
{
    NSString *plistDir = [NSString stringWithFormat:@"%@/properties.plist", [CPFileManager folderDirOfCar:carName]];
    return plistDir;
}

+ (NSArray *)loadModels
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"];
    NSArray *cars = [NSArray arrayWithContentsOfFile:plistPath];
    return cars;
}

- (void)createCarFolders
{
    NSArray *carModels = [CPFileManager loadModels];
    for (NSString *carName in carModels) {
        NSString *carDir = [NSString stringWithFormat:@"%@/%@", [CPFileManager documentPath], carName];
        BOOL existed = [self.fileMgr fileExistsAtPath:carDir];
        if ( !existed)
        {
            [self.fileMgr createDirectoryAtPath:carDir withIntermediateDirectories:YES attributes:nil error:nil];
            // 在创建的目录下创建plist文件
            NSString *plistDir = [NSString stringWithFormat:@"%@/%@.plist", carDir, carName];
            if (![self.fileMgr fileExistsAtPath:plistDir]) {
                NSDictionary *dic = [self propertyDictionary];
                [dic writeToFile:plistDir atomically:YES];
            }
        }
    }
}

// 创建用于生成plist文件的字典
- (NSDictionary *)propertyDictionary
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         NUMBER(0), @"length",
                         NUMBER(0), @"width",
                         NUMBER(0), @"height",
                         @"", @"name",
                         [[NSArray alloc] init], @"pictures",
                         nil];
    return dic;
}


@end
