//
//  EUIContainerController.m
//  EUI
//
//  Created by Elisha Cook on 2/15/13.
//  Copyright (c) 2013 Elisha Cook. All rights reserved.
//

#import "EUIContainerController.h"
#import "EUIContainer.h"

@interface EUIContainerController ()

@end

@implementation EUIContainerController

- (id)loadView
{
    self.view = (UIView *)[[EUIContainer alloc] init];
}

- (EUIContainer *)container
{
    return (EUIContainer *)self.view;
}

@end
