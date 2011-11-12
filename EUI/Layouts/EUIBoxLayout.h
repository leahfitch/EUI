//
//  EUIBoxLayout.h
//  EUI
//
//  Created by 1234 1234 on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EUILayout.h"

typedef enum 
{
    EUIBoxLayoutDirectionHorizontal,
    EUIBoxLayoutDirectionVertical
} EUIBoxLayoutDirection;

@interface EUIBoxLayout : EUILayout
@property (nonatomic) CGFloat spacing;
@property (nonatomic) EUIBoxLayoutDirection direction;

@end
