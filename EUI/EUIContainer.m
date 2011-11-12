//
//  EUIContainer.m
//  EUI
//
//  Created by 1234 1234 on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EUIContainer.h"
#import "EUILayout.h"


@implementation EUIContainer

@synthesize padding, layout;


- (void)setPadding:(UIEdgeInsets)newPadding
{
    padding = newPadding;
    [self.layout containerBoundsChanged];
}


- (void)setLayout:(EUILayout *)newLayout
{
    layout = newLayout;
    layout.container = self;
}


- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    [self.layout containerBoundsChanged];
}

- (void)setFrame:(CGRect)newFrame
{
    CGRect oldFrame = self.frame;
    [super setFrame:newFrame];
    
    if (oldFrame.size.width != newFrame.size.width || oldFrame.size.height != newFrame.size.height)
    {
        [self.layout containerBoundsChanged];
    }
}

- (void)didAddSubview:(UIView *)subview
{
    [self.layout didAddSubview:subview];
}


- (void)willRemoveSubview:(UIView *)subview
{
    [self.layout willRemoveSubview:subview];
}

@end
