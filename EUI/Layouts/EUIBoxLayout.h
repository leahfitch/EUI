//
//  EUIBoxLayout.h
//  EUI
//
//  Created by Elisha Cook on 11/11/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUILayout.h"

typedef enum 
{
    EUIBoxLayoutDirectionHorizontal,
    EUIBoxLayoutDirectionVertical
} EUIBoxLayoutDirection;

@interface EUIBoxLayout : EUILayout
{
    NSInteger lastSubviewIndex;
    CGFloat curPos;
    CGFloat maxWidth;
    CGFloat maxHeight;
}
@property (nonatomic) CGFloat spacing;
@property (nonatomic) EUIBoxLayoutDirection direction;


@end
