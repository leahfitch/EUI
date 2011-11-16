//
//  EUIFlowLayout.h
//  EUI
//
//  Created by 1234 1234 on 11/15/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUILayout.h"

typedef enum 
{
    EUIFlowLayoutAlignmentLeft,
    EUIFlowLayoutAlignmentRight,
    EUIFlowLayoutAlignmentCenter
} EUIFlowLayoutAlignment;

@interface EUIFlowLayout : EUILayout
@property (nonatomic) CGFloat spacing;
@property (nonatomic) EUIFlowLayoutAlignment alignment;
@end
