//
//  EUIBoxLayout.m
//  EUI
//
//  Created by Elisha Cook on 11/11/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUIBoxLayout.h"
#import "EUIContainer.h"


@implementation EUIBoxLayout

@synthesize spacing, direction;


- (CGSize)containerSize
{
    CGSize size = self.container.frame.size;
    
    curPos -= spacing;
    
    if (self.direction == EUIBoxLayoutDirectionVertical)
    {
        curPos += self.container.padding.bottom;
        size.height = curPos;
        size.width = self.container.padding.left + maxWidth + self.container.padding.right;
    }
    else
    {
        curPos += self.container.padding.right;
        size.width = curPos;
        size.height = self.container.padding.top + maxHeight + self.container.padding.bottom;
    }
    
    return size;
}


- (CGPoint)pointOfSubview:(NSUInteger)i withSize:(CGSize)size
{
    CGPoint p;
    
    if (i == lastSubviewIndex+1)
    {
        if (direction == EUIBoxLayoutDirectionVertical)
        {
            p.y = curPos;
            p.x = self.container.padding.left;
            curPos += size.height + spacing;
        }
        else
        {
            p.x = curPos;
            p.y = self.container.padding.top;
            curPos += size.width + spacing;
        }
        
        maxWidth = fmaxf(maxWidth, size.width);
        maxHeight = fmaxf(maxHeight, size.height);
        lastSubviewIndex++;
    }
    else
    {
        if (i == 0)
        {
            p.x = self.container.padding.left;
            p.y = self.container.padding.top;
        }
        else
        {
            UIView *lastView = [self.container.subviews objectAtIndex:i-1];
            
            if (direction == EUIBoxLayoutDirectionVertical)
            {
                p.x = self.container.padding.left;
                p.y = lastView.frame.origin.y + lastView.frame.size.height + spacing;
            }
            else
            {
                p.x = lastView.frame.origin.x + lastView.frame.size.width + spacing;
                p.y = self.container.padding.top;
            }
        }
    }
    
    return p;
}


- (void)willLayoutContainer
{
    lastSubviewIndex = -1;
    curPos = self.direction == EUIBoxLayoutDirectionVertical ? self.container.padding.top : self.container.padding.left;
    maxWidth = 0;
    maxHeight = 0;
}

@end
