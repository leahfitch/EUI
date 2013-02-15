#import "EUIContainerController.h"
#import "EUIContainer.h"
#import "EUILayout.h"

@interface EUIContainerController ()

@end

@implementation EUIContainerController

- (id)loadView
{
    self.view = (UIView *)[[EUIContainer alloc] init];
}

- (EUIContainer *)container
{
    return (EUIContainer *)self.view;
}

@end
