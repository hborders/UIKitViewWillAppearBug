//
//  HBAppDelegate.m
//  UIKitViewWillAppearBug
//
//  Created by dev1 on 9/18/12.
//  Copyright (c) 2012 Heath Borders. All rights reserved.
//

#import "HBAppDelegate.h"
#import "HBContainmentViewController.h"
#import "HBTestViewController.h"

@interface HBAppDelegate()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation HBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    UIViewController *viewController = [UIViewController new];
    viewController.title = @"Main";

    CGRect selectRedThenBlueButtonFrame;
    CGRect selectJustRedButtonFrame;
    CGRectDivide(viewController.view.bounds,
                 &selectRedThenBlueButtonFrame,
                 &selectJustRedButtonFrame,
                 CGRectGetHeight(viewController.view.bounds) / 2,
                 CGRectMinYEdge);

    UIButton *selectRedThenBlueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    selectRedThenBlueButton.autoresizingMask =
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    selectRedThenBlueButton.frame = selectRedThenBlueButtonFrame;
    [selectRedThenBlueButton addTarget:self
                                action:@selector(selectRedThenBlueButtonTouchUpInside)
                      forControlEvents:UIControlEventTouchUpInside];
    [selectRedThenBlueButton setTitle:@"Select Red Then Blue"
                             forState:UIControlStateNormal];
    [viewController.view addSubview:selectRedThenBlueButton];

    UIButton *selectJustRedButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    selectJustRedButton.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    selectJustRedButton.frame = selectJustRedButtonFrame;
    [selectJustRedButton addTarget:self
                            action:@selector(selectJustRedButtonTouchUpInside)
                  forControlEvents:UIControlEventTouchUpInside];
    [selectJustRedButton setTitle:@"Select Just Red"
                         forState:UIControlStateNormal];
    [viewController.view addSubview:selectJustRedButton];

    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = self.navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void) selectRedThenBlueButtonTouchUpInside {
    HBTestViewController *testViewController1 = [[HBTestViewController alloc] initWithBackgroundColor:[UIColor redColor]];
    testViewController1.title = @"Red";
    HBTestViewController *testViewController2 = [[HBTestViewController alloc] initWithBackgroundColor:[UIColor blueColor]];
    testViewController2.title = @"Blue";
    HBContainmentViewController *containmentViewController = [HBContainmentViewController new];
    containmentViewController.title = @"Red Then Blue";
    containmentViewController.viewControllers = @[
    testViewController1,
    testViewController2,
    ];

    [self.navigationController pushViewController:containmentViewController
                                         animated:YES];
    containmentViewController.selectedViewController = testViewController2;
}

- (void) selectJustRedButtonTouchUpInside {
    HBTestViewController *testViewController1 = [[HBTestViewController alloc] initWithBackgroundColor:[UIColor redColor]];
    testViewController1.title = @"Red";
    HBTestViewController *testViewController2 = [[HBTestViewController alloc] initWithBackgroundColor:[UIColor blueColor]];
    testViewController2.title = @"Blue";
    HBContainmentViewController *containmentViewController = [HBContainmentViewController new];
    containmentViewController.title = @"Just Red";
    containmentViewController.viewControllers = @[
    testViewController1,
    testViewController2,
    ];

    [self.navigationController pushViewController:containmentViewController
                                         animated:YES];
}

@end
