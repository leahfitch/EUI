//
//  EUIKSDetailViewController.h
//  EUI Kitchen Sink
//
//  Created by Elisha Cook on 11/15/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EUIContainer.h"

@interface EUIKSDetailViewController : UIViewController <
UISplitViewControllerDelegate,
EUIContainerDelegate>

@property (strong, nonatomic) EUIContainer *container;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)randomizeSubviews;

- (void)regimentSubviews;

- (void)boxLayoutHorizontal;

- (void)boxLayoutVertical;

@end
