//
//  EUIKSMasterViewController.h
//  EUI Kitchen Sink
//
//  Created by Elisha Cook on 11/15/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUIKSDetailViewController;

@interface EUIKSMasterViewController : UITableViewController

@property (strong, nonatomic) EUIKSDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *demoSelectors;


@end
