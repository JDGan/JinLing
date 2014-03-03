//
//  CPNavigationViewController.m
//  CompassDemo
//
//  Created by Ding Dazhuo on 14-2-22.
//  Copyright (c) 2014年 burnish. All rights reserved.
//

#import "CPNavigationViewController.h"
#import "CPMainPageViewController.h"

@interface CPNavigationViewController ()

@end

@implementation CPNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CPMainPageViewController *main = [[CPMainPageViewController alloc] init];
        self.viewControllers = [NSArray arrayWithObject:main];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
