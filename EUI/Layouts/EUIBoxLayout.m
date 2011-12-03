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


- (void)updatePoints:(CGPoint *)points forSizes:(CGSize *)sizes
{
    CGPoint curPoint = CGPointMake(self.container.padding.left, self.container.padding.top);
    CGFloat maxWidth = 0;
    CGFloat maxHeight = 0;
    
    for (int i=0; i<[self.container.subviews count]; i++)
    {
        points[i] = curPoint;
        CGSize size = sizes[i];
        
        if (self.direction == EUIBoxLayoutDirectionVertical)
        {
            curPoint.y += size.height + self.spacing;
            maxWidth = fmaxf(maxWidth, size.width);
        }
        else
        {
            curPoint.x += size.width += self.spacing;
            maxHeight = fmaxf(maxHeight, size.height);
        }
    }
    
    CGRect containerFrame = self.container.frame;
    
    if (self.direction == EUIBoxLayoutDirectionVertical)
    {
        containerFrame.size = CGSizeMake(self.container.padding.left + self.container.padding.right + maxWidth, 
                                   self.container.padding.bottom + (curPoint.y - self.spacing));
    }
    else
    {
        containerFrame.size = CGSizeMake(self.container.padding.right + (curPoint.x - self.spacing), 
                                   self.container.padding.top + self.container.padding.bottom + maxHeight);
    }
    
    self.container.frame = containerFrame;
}

@end
