//
//  CPCustomTabBarViewController.m
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-22.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#import "CPCustomTabBarViewController.h"
#import "CPDataCenter.h"


@interface CPCustomTabBarViewController ()
{
    NSArray *_tabTitles;
    CPDataCenter *_dataCenter;
}
// 车型名称
@property (nonatomic, copy)NSString *carName;
//车型参数字典
@property (nonatomic, strong)NSDictionary *carPropertyDic;

@end

@implementation CPCustomTabBarViewController

- (id)initWithCarName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.carName = name;
        _tabTitles = [NSArray arrayWithObjects:
                      @"配置与参数",
                      @"动力",
                      @"内饰",
                      @"外观",
                      @"驾控",
                      @"安全",
                      @"车型对比",
                      nil];
        _dataCenter = [CPDataCenter center];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.carName;
//    tabbar选项
    float btnWidth = SCREEN_WIDTH / _tabTitles.count;
    float btnHeight = 50.f;
    float btnOriginY = SCREEN_HEIGHT + NAVIGATION_YOFFSET_ADJUSTMENT - btnHeight - NAVIBAR_HEIGHT - STATUS_BAR_HEIGHT;
    for (int i = 0; i < _tabTitles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i * btnWidth, btnOriginY, btnWidth, btnHeight);
        button.tag = i;
        button.backgroundColor = [UIColor greenColor];
        [button setTitle:[_tabTitles objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tabBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
//从加载车型信息
    self.carPropertyDic = [_dataCenter loadPropertiesByCarName:self.carName];
    if ([self.carPropertyDic allKeys].count) {
        NSString *carName = [self.carPropertyDic objectForKey:@"name"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!" message:carName delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)tabBtnClicked:(UIButton *)sender
{
    int tag = sender.tag;
    NSLog(@"%@", [_tabTitles objectAtIndex:tag]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
