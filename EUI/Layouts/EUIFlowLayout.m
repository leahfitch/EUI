#import "EUIFlowLayout.h"
#import "EUIContainer.h"


@interface Row : NSObject
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (strong,nonatomic) NSMutableArray *sizes;
@end

@implementation Row

@synthesize width, height, sizes;

- (id)init
{
    if (self = [super init])
    {
        self.width = 0;
        self.height = 0;
        self.sizes = [NSMutableArray array];
    }
    
    return self;
}

- (void)addSize:(CGSize)size
{
    [self.sizes addObject:[NSValue valueWithCGSize:size]];
}

- (CGSize)sizeAt:(NSUInteger)i
{
    NSValue *value = [self.sizes objectAtIndex:i];
    return [value CGSizeValue];
}

@end


@interface EUIFlowLayout ()

@property (strong,nonatomic) NSMutableArray *rows;

@end



@implementation EUIFlowLayout

@synthesize alignment, spacing, rows;


- (CGPoint)startPointForRow:(Row *)row
{
    switch (self.alignment)
    {
        case EUIFlowLayoutAlignmentLeft:
            return CGPointMake(self.container.padding.left, self.container.padding.top);
            
        case EUIFlowLayoutAlignmentRight:
            return CGPointMake(self.container.frame.size.width - (self.container.padding.right + row.width), self.container.padding.top);
            
        case EUIFlowLayoutAlignmentCenter:
            return CGPointMake((self.container.frame.size.width / 2) - (row.width / 2), self.container.padding.top);
            
        default:
            break;
    }
}


- (void)updatePoints:(CGPoint *)points forSizes:(CGSize *)sizes
{
    if ([self.container.subviews count] == 0)
    {
        return;
    }
    
    CGFloat maxWidth = self.container.frame.size.width - (self.container.padding.left + self.container.padding.right);
    self.rows = [NSMutableArray array];
    Row *currentRow = [[Row alloc] init];
    
    
    for (int i=0; i<[self.container.subviews count]; i++)
    {
        CGSize size = sizes[i];
        
        if (currentRow.width + size.width > maxWidth)
        {
            currentRow.width -= self.spacing;
            [self.rows addObject:currentRow];
            currentRow = [[Row alloc] init];
        }
        
        [currentRow addSize:size];
        currentRow.width += size.width + self.spacing;
        currentRow.height = fmaxf(currentRow.height, size.height);
    }
    
    if ([currentRow.sizes count] > 0)
    {
        currentRow.width -= self.spacing;
        [self.rows addObject:currentRow];
    }
    
    currentRow = [self.rows objectAtIndex:0];
    CGPoint curPoint = [self startPointForRow:currentRow];
    NSUInteger row_i = 0;
    NSUInteger size_i = 0;
    
    for (NSUInteger i=0; i<[self.container.subviews count]; i++)
    {
        if (size_i == [currentRow.sizes count])
        {
            size_i = 0;
            row_i++;
            
            if (row_i < [self.rows count])
            {
                curPoint.y += currentRow.height + self.spacing;
                currentRow = [self.rows objectAtIndex:row_i];
                CGPoint rowPoint = [self startPointForRow:currentRow];
                curPoint.x = rowPoint.x;
            }
            else
            {
                currentRow = nil;
            }
        }
        
        points[i] = curPoint;
        CGSize size = [currentRow sizeAt:size_i];
        curPoint.x += size.width + self.spacing;
        size_i++;
    }
    
    CGFloat height = self.container.padding.top + self.container.padding.bottom;
    height += ([self.rows count] - 1) * self.spacing;
    
    for (Row *row in self.rows)
    {
        height += row.height;
    }
    
    CGRect containerFrame = self.container.frame;
    containerFrame.size.height = height;
    self.container.frame = containerFrame;
}

@end
