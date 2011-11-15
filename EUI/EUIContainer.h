//
//  EUIContainer.h
//  EUI
//
//  Created by Elisha Cook on 11/11/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUIContainer;

@protocol EUIContainerDelegate <NSObject>

@optional

- (void)containerSizeChanged:(EUIContainer *)container;

@end

@class EUILayout;

@interface EUIContainer : UIView

@property (nonatomic) UIEdgeInsets padding;
@property (strong, nonatomic) EUILayout *layout;
@property (weak,nonatomic) id <EUIContainerDelegate> delegate;

@end
