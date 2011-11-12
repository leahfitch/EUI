//
//  EUIBoxLayout.m
//  EUI
//
//  Created by 1234 1234 on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EUIBoxLayout.h"
#import "EUIContainer.h"


@implementation EUIBoxLayout

@synthesize spacing, direction;


- (CGFloat)getPosAfterView:(UIView *)view
{
    if (direction == EUIBoxLayoutDirectionVertical)
    {
        return view.frame.origin.y + view.frame.size.height + spacing;
    }
    else
    {
        return view.frame.origin.x + view.frame.size.width + spacing;
    }
}


- (void)setPos:(CGFloat)pos forView:(UIView *)view
{
    CGRect f = view.frame;
    
    if (direction == EUIBoxLayoutDirectionVertical)
    {
        f.origin.y = pos;
    }
    else
    {
        f.origin.x = pos;
    }
}


- (CGFloat)getStartPadding
{
    if (direction == EUIBoxLayoutDirectionVertical)
    {
        return container.padding.top;
    }
    else
    {
        return container.padding.left;
    }
}

- (CGFloat)getMaxHeight
{
    CGFloat max = 0;
    
    for (UIView *v in container.subviews)
    {
        if (v.frame.size.height > max)
        {
            max = v.frame.size.height;
        }
    }
    
    return max;
}

- (CGFloat)getMaxWidth
{
    CGFloat max = 0;
    
    for (UIView *v in container.subviews)
    {
        if (v.frame.size.width > max)
        {
            max = v.frame.size.width;
        }
    }
    
    return max;
}

- (void)updateContainerSizeForPos:(CGFloat)pos
{
    CGRect bounds = container.bounds;
    
    if (self.direction == EUIBoxLayoutDirectionVertical)
    {
        pos += container.padding.bottom;
        bounds.size.height = pos;
        bounds.size.width = container.padding.left + [self getMaxWidth] + container.padding.right;
    }
    else
    {
        pos += container.padding.right;
        bounds.size.height = pos;
        bounds.size.width = container.padding.top + [self getMaxHeight] + container.padding.bottom;
    }
    
    container.bounds = bounds;
}

- (void)reflowFrom:(UIView *)subview ignoringView:(UIView *)ignoredView
{
    NSUInteger i;
    CGFloat pos;
    
    if (subview == nil)
    {
        i = pos = [self getStartPadding];
    }
    else
    {
        i = [container.subviews indexOfObject:subview] + 1;
        
        UIView *lastView = [container.subviews objectAtIndex:i-1];
        
        if (lastView == ignoredView)
        {
            lastView = [container.subviews objectAtIndex:i-1];
            
            if (!lastView)
            {
                i = pos = [self getStartPadding];
            }
        }
        
        if (lastView)
        {
            pos = [self getPosAfterView:lastView];
        }
    }
    
    BOOL viewsProcessed = FALSE;
    
    for (; i<[container.subviews count]; i++)
    {
        UIView *v = [container.subviews objectAtIndex:i];
        
        if (v == ignoredView)
        {
            continue;
        }
        
        [self setPos:pos forView:v];
        pos = [self getPosAfterView:v];
        
        viewsProcessed = TRUE;
    }
    
    if (viewsProcessed)
    {
        pos -= spacing;
    }
    
    [self updateContainerSizeForPos:pos];
}

- (void)reflowFrom:(UIView *)subview
{
    [self reflowFrom:subview ignoringView:nil];
}

- (void)didAddSubview:(UIView *)view
{
    [self reflowFrom:view];
}

- (void)willRemoveSubview:(UIView *)view
{
    NSInteger i = [container.subviews indexOfObject:view] - 1;
    
    if (i < 0)
    {
        [self reflowFrom:nil ignoringView:view];
        return;
    }
    
    [self reflowFrom:[container.subviews objectAtIndex:i]];
}

- (void)subviewBoundsChanged:(UIView *)view
{
    [self reflowFrom:view];
}

- (void)containerBoundsChanged
{
    // Box layouts shouldn't be resized manually.
}

@end
