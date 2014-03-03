//
//  CPCustomCarViewController.m
//  Compass
//
//  Created by Ding Dazhuo on 14-3-1.
//  Copyright (c) 2014年 Dazhuo Ding. All rights reserved.
//

#import "CPCustomCarViewController.h"
#import "CPTabScrollView.h"

@interface CPCustomCarViewController ()
<JDGTabScrollDatasource>
@end

@implementation CPCustomCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    CPTabScrollView *scrollView = [[CPTabScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH)];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    scrollView.dataSource = self;
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
