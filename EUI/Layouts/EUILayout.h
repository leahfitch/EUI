//
//  EUILayout.h
//  EUI
//
//  Created by Elisha Cook on 11/11/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUIContainer;

@interface EUILayout : NSObject
{
    __weak EUIContainer *container;
}
@property (weak,nonatomic)  EUIContainer *container;

- (void)layoutContainer;

- (void)layoutContainerWithSubviewSizes:(CGSize [])subviewSizes;

- (CGPoint)pointOfSubview:(NSUInteger)i withSize:(CGSize)size;

- (CGSize)containerSize;

- (void)willLayoutContainer;

- (void)didLayoutContainer;

@end
