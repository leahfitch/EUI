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
