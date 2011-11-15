//
//  EUIKSDetailViewController.m
//  EUI Kitchen Sink
//
//  Created by Elisha Cook on 11/15/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUIKSDetailViewController.h"
#import "EUIBoxLayout.h"


@implementation EUIKSDetailViewController

@synthesize masterPopoverController, container;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.container = [[EUIContainer alloc] initWithFrame:CGRectZero];
    self.container.backgroundColor = [UIColor lightGrayColor];
    self.container.padding = UIEdgeInsetsMake(12, 12, 12, 12);
    self.container.delegate = self;
    [self.view addSubview:self.container];
    
    for (int i=0; i<20; i++)
    {
        int n = (arc4random() % 201) + 20;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, n, n)];
        label.backgroundColor = [UIColor orangeColor];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor darkGrayColor];
        label.text = [NSString stringWithFormat:@"%d", i+1];
        [self.container addSubview:label];
    }
    
    EUIBoxLayout *boxLayout = [[EUIBoxLayout alloc] init];
    boxLayout.direction = EUIBoxLayoutDirectionHorizontal;
    boxLayout.spacing = 12;
    self.container.layout = boxLayout;
    [boxLayout layoutContainer];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Demos", @"Demos");
    }
    return self;
}

- (void)containerSizeChanged:(EUIContainer *)theContainer
{
    ((UIScrollView *)self.view).contentSize = self.container.frame.size;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Demos", @"Demos");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


- (void)randomizeSubviews
{
    [UIView animateWithDuration:0.3 animations:^
    {
        CGSize sizes[[self.container.subviews count]];
        
        for (int i=0; i<[self.container.subviews count]; i++)
        {
            int n = (arc4random() % 201) + 20;
            sizes[i] = CGSizeMake(n, n);
        }
        
        [self.container.layout layoutContainerWithSubviewSizes:sizes];
    }];
}

- (void)regimentSubviews
{
    CGSize s = CGSizeMake(50, 50);
    
    [UIView animateWithDuration:0.3 animations:^
     {
         CGSize sizes[[self.container.subviews count]];
         
         for (int i=0; i<[self.container.subviews count]; i++)
         {
             sizes[i] = s;
         }
         
         [self.container.layout layoutContainerWithSubviewSizes:sizes];
     }];
}


- (void)boxLayoutHorizontal
{
    EUIBoxLayout *boxLayout = [[EUIBoxLayout alloc] init];
    boxLayout.direction = EUIBoxLayoutDirectionHorizontal;
    boxLayout.spacing = 12;
    self.container.layout = boxLayout;
    
    [UIView animateWithDuration:0.3 animations:^{
        [boxLayout layoutContainer];
    }];
}

- (void)boxLayoutVertical
{
    EUIBoxLayout *boxLayout = [[EUIBoxLayout alloc] init];
    boxLayout.direction = EUIBoxLayoutDirectionVertical;
    boxLayout.spacing = 12;
    self.container.layout = boxLayout;
    
    [UIView animateWithDuration:0.3 animations:^{
        [boxLayout layoutContainer];
    }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return TRUE;
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (self.container.layout)
    {
        [self.container.layout layoutContainer];
    }
}

@end
