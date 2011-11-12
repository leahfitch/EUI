//
//  EUILayout.h
//  EUI
//
//  Created by 1234 1234 on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUIContainer;

@interface EUILayout : NSObject
{
    __weak EUIContainer *container;
}
@property (weak,nonatomic)  EUIContainer *container;

- (void)didAddSubview:(UIView *)view;

- (void)willRemoveSubview:(UIView *)view;

- (void)subviewBoundsChanged:(UIView *)view;

- (void)containerBoundsChanged;

@end
