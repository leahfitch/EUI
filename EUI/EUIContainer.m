#import "EUIContainer.h"
#import "EUILayout.h"


@implementation EUIContainer

@synthesize padding, layout, delegate;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.autoresizesSubviews = FALSE;
    }
    
    return self;
}

- (void)setLayout:(EUILayout *)newLayout
{
    layout = newLayout;
    layout.container = self;
}

- (void)setFrame:(CGRect)newFrame
{
    CGRect oldFrame = self.frame;
    [super setFrame:newFrame];
    
    if (newFrame.size.width != oldFrame.size.width ||
        newFrame.size.height != oldFrame.size.height)
    {
        [self.delegate containerSizeChanged:self];
    }
}


- (void)setBounds:(CGRect)newBounds
{
    CGRect oldBounds = self.bounds;
    [super setBounds:newBounds];
    
    if (newBounds.size.width != oldBounds.size.width ||
        newBounds.size.height != oldBounds.size.height)
    {
        [self.delegate containerSizeChanged:self];
    }
}

@end
