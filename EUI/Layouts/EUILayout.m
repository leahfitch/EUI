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


- (void)updateContainerSize
{
    CGRect containerFrame = self.container.frame;
    containerFrame.size = [self containerSize];
    self.container.frame = containerFrame;
}


- (void)layoutContainer
{
    [self willLayoutContainer];
    
    for (NSUInteger i=0; i<[self.container.subviews count]; i++)
    {
        UIView *v = [self.container.subviews objectAtIndex:i];
        CGPoint p = [self pointOfSubview:i withSize:v.frame.size];
        v.frame = CGRectMake(p.x, p.y, v.frame.size.width, v.frame.size.height);
    }
    
    [self updateContainerSize];
    [self didLayoutContainer];
}

- (void)layoutContainerWithSubviewSizes:(CGSize [])subviewSizes
{
    [self willLayoutContainer];
    
    for (int i=0; i<[self.container.subviews count]; i++)
    {
        UIView *v = [self.container.subviews objectAtIndex:i];
        CGSize s = subviewSizes[i];
        CGPoint p = [self pointOfSubview:i withSize:s];
        v.frame = CGRectMake(p.x, p.y, s.width, s.height);
    }
    
    [self updateContainerSize];
    [self didLayoutContainer];
}

- (CGPoint)pointOfSubview:(NSUInteger)i withSize:(CGSize)size;
{
    return CGPointZero;
}

- (CGSize)containerSize
{
    return CGSizeZero;
}

- (void)willLayoutContainer
{
    
}

- (void)didLayoutContainer
{
    
}

@end
