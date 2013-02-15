#import "EUIGridLayout.h"
#import "EUIContainer.h"

@implementation EUIGridLayout

@synthesize columns, rows, spacing;

- (void)updatePoints:(CGPoint *)points forSizes:(CGSize *)sizes
{
    if (self.columns == 0 && self.rows == 0)
    {
        self.columns = 3;
        self.rows = 0;
    }
    
    if (self.columns == 0)
    {
        self.columns = ceil([self.container.subviews count] / (double)self.rows);
    }
    else if (self.rows == 0)
    {
        self.rows = ceil([self.container.subviews count] / (double)self.columns);
    }
    
    CGFloat innerWidth = self.container.frame.size.width - self.container.padding.left - self.container.padding.right;
    CGFloat innerHeight =self.container.frame.size.height - self.container.padding.top - self.container.padding.bottom; 
    CGSize cellSize = CGSizeMake((innerWidth - ((self.columns - 1) * self.spacing))/self.columns, 
                                 (innerHeight - ((self.rows - 1) * self.spacing))/self.rows);
    
    CGPoint curPoint = CGPointMake(self.container.padding.left, self.container.padding.top);
    NSUInteger curCol = 0;
    NSUInteger curRow = 0;
    
    for (NSUInteger i=0; i<[self.container.subviews count]; i++)
    {
        if (curCol == self.columns)
        {
            curCol = 0;
            curRow++;
            
            curPoint.x = self.container.padding.left;
            curPoint.y += cellSize.height + self.spacing;
        }
        
        sizes[i] = cellSize;
        points[i] = curPoint;
        curPoint.x += cellSize.width + self.spacing;
        curCol++;
    }
}

@end
