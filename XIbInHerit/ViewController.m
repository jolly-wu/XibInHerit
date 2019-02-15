//
//  ViewController.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "ViewController.h"
#import "./ViewInHerit/supperNib/BaseView.h"
#import "./ViewInHerit/subNib/SubView.h"
#import "./NibLoader/NibLoader.h"
#import "./ViewInHerit/loader+UIView.h"

@interface ViewController ()
{
    NibLoader * loader;
}
@end

@implementation ViewController

- (void)setup
{
    loader = [[NibLoader alloc] init];
    [self concreateView];
}

- (void)concreateView
{
    SubView * view = [UIView nib_load:SubView.class];
    [view iv_setOrigin:CGPointMake(0, 64)];
//    [view iv_viewOfClass:BaseView.class].touchPassThrough = NO;
    view.baseView.touchPassThrough = YES;
    view.secView.touchPassThrough = YES;
    [self.view addSubview:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
