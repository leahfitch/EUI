#import <UIKit/UIKit.h>

@class EUIContainer;

@interface EUILayout : NSObject
{
    __weak EUIContainer *container;
}
@property (weak,nonatomic)  EUIContainer *container;

- (void)layoutContainer;

- (void)layoutContainerWithSubviewSizes:(CGSize *)subviewSizes;

- (void)updatePoints:(CGPoint *)points forSizes:(CGSize *)sizes;

@end
