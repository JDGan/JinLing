//
//  CPMainPageViewController.m
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-22.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#import "CPMainPageViewController.h"
#import "CPDataCenter.h"
#import "CPCustomTabBarViewController.h"
#import "CPCustomCarViewController.h"

@interface CPMainPageViewController ()

@end

@implementation CPMainPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Main Page";
//    NSLog(@"self.view.frame = (%f, %f, %f, %f)",
//          self.view.frame.origin.x,
//          self.view.frame.origin.y,
//          self.view.frame.size.width,
//          self.view.frame.size.height);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Main Page";
    [label sizeToFit];
    label.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    [self.view addSubview:label];
    
//  从plsit文件中加载车型信息
    NSArray *cars = [[CPDataCenter center] carModelNames];
//  添加车型按钮
    for (NSString *carName in cars) {
        int index = [cars indexOfObject:carName];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:carName forState:UIControlStateNormal];
        [button sizeToFit];
        button.center = CGPointMake(label.center.x, label.center.y + 40 * (index + 1));
        [button addTarget:self action:@selector(toTabBarVC:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    //定制按钮
    UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [customBtn setTitle:[NSString stringWithFormat:@"定制"] forState:UIControlStateNormal];
    [customBtn sizeToFit];
    customBtn.frame = CGRectMake(0, NAVIGATION_YOFFSET_ADJUSTMENT, 100, 45);
    [customBtn addTarget:self action:@selector(customBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customBtn];
}


- (void)toTabBarVC:(UIButton *)btn
{
    NSString *carName = btn.titleLabel.text;
    NSLog(@"您选择了%@", carName);
    CPCustomTabBarViewController *tab = [[CPCustomTabBarViewController alloc] initWithCarName:carName];
    [self.navigationController pushViewController:tab animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customBtnClicked
{
    CPCustomCarViewController *custom = [[CPCustomCarViewController alloc] init];
    self.title = @"定制";
    [self.navigationController pushViewController:custom animated:YES];
}

@end
