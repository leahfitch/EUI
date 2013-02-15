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
