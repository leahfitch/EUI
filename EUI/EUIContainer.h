//
//  EUIContainer.h
//  EUI
//
//  Created by 1234 1234 on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUILayout;

@interface EUIContainer : UIView

@property (nonatomic) UIEdgeInsets padding;
@property (strong, nonatomic) EUILayout *layout;

@end
