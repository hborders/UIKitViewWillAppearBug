
#import "HBContainmentViewController.h"

@implementation HBContainmentViewController

#pragma mark - init/dealloc

- (id)init {
    return [super initWithNibName:nil
                           bundle:nil];
}

#pragma mark - UIViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    BOOL shouldAutorotate = YES;
    for (UIViewController *viewController in self.viewControllers) {
        if (![viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation]) {
            shouldAutorotate = NO;
            break;
        }
    }
    return shouldAutorotate;
}

#pragma mark - public API

- (void) setViewControllers:(NSArray *)viewControllers {
    if (_viewControllers != viewControllers) {
        [self view]; //guarantee loadView gets called
        self.selectedViewController = nil;

        _viewControllers = viewControllers;

        if ([viewControllers count] > 0) {
            self.selectedViewController = [viewControllers objectAtIndex:0];
        } else {
            self.selectedViewController = nil;
        }
    }
}

- (void) setSelectedViewController:(UIViewController *)selectedViewController {
    if (_selectedViewController != selectedViewController) {
        if (_selectedViewController) {
            [_selectedViewController willMoveToParentViewController:nil];
            [_selectedViewController.view removeFromSuperview];
            [_selectedViewController removeFromParentViewController];
        }

        _selectedViewController = selectedViewController;

        if (_selectedViewController) {
            [self view]; // guarantee loadView gets called
            [self addChildViewController:_selectedViewController];

            _selectedViewController.view.autoresizingMask =
            UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleHeight;
            _selectedViewController.view.frame = self.view.bounds;
            [self.view addSubview:_selectedViewController.view];

            [_selectedViewController didMoveToParentViewController:self];
        }
    }
}

@end
