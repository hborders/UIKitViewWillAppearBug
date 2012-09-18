//
//  HBTestViewController.m
//  UIKitViewWillAppearBug
//
//  Created by dev1 on 9/18/12.
//  Copyright (c) 2012 Heath Borders. All rights reserved.
//

#import "HBTestViewController.h"

@interface HBTestViewController ()

@property (nonatomic, strong) UIColor *backgroundColor;

@end

@implementation HBTestViewController

- (id) initWithBackgroundColor:(UIColor *) backgroundColor {
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) {
        self.backgroundColor = backgroundColor;
    }

    return self;
}

#pragma mark - NSObject

- (NSString *) description {
    return [NSString stringWithFormat:@"%@: %p, \"%@\"",
            NSStringFromClass([self class]),
            self,
            self.title];
}

#pragma mark - UIViewController

- (void)loadView {
    [super loadView];

    self.view.backgroundColor = self.backgroundColor;

    NSLog(@"loadView: %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"viewDidLoad: %@", self);
}

- (void)viewDidUnload {
    [super viewDidUnload];

    NSLog(@"viewDidUnload: %@", self);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"viewWillAppear: %@", self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"viewDidAppear: %@", self);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"viewWillDisappear: %@", self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"viewDidDisappear: %@", self);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
