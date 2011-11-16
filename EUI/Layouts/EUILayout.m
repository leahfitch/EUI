//
//  EUILayout.m
//  EUI
//
//  Created by Elisha Cook on 11/11/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUILayout.h"
#import "EUIContainer.h"

@implementation EUILayout

@synthesize container;

- (void)layoutContainer
{
    CGSize sizes[[self.container.subviews count]];
    
    for (NSUInteger i=0; i<[self.container.subviews count]; i++)
    {
        UIView *view = [self.container.subviews objectAtIndex:i];
        sizes[i] = view.frame.size;
    }
    
    [self layoutContainerWithSubviewSizes:sizes];
}

- (void)layoutContainerWithSubviewSizes:(CGSize *)subviewSizes
{
    CGPoint points[[self.container.subviews count]];
    [self updatePoints:points forSizes:subviewSizes];
    
    for (int i=0; i<[self.container.subviews count]; i++)
    {
        UIView *view = [self.container.subviews objectAtIndex:i];
        CGSize size = subviewSizes[i];
        CGPoint point = points[i];
        view.frame = CGRectMake(point.x, point.y, size.width, size.height);
    }
}

- (void)updatePoints:(CGPoint *)points forSizes:(CGSize *)sizes
{
    
}

@end
