//
//  EUIKSMasterViewController.m
//  EUI Kitchen Sink
//
//  Created by Elisha Cook on 11/15/11.
//  Copyright (c) 2011 Elisha Cook. All rights reserved.
//

#import "EUIKSMasterViewController.h"

#import "EUIKSDetailViewController.h"

@implementation EUIKSMasterViewController

@synthesize detailViewController, demoSelectors;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Demos", @"Demos");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        
        self.demoSelectors = [NSArray arrayWithObjects:
                              [NSArray arrayWithObjects:@"Randomize", [NSValue valueWithPointer:@selector(randomizeSubviews)], nil],
                              [NSArray arrayWithObjects:@"Regiment", [NSValue valueWithPointer:@selector(regimentSubviews)], nil],
                              [NSArray arrayWithObjects:@"Box Layout (horizontal)", [NSValue valueWithPointer:@selector(boxLayoutHorizontal)], nil],
                              [NSArray arrayWithObjects:@"Box Layout (vertical)", [NSValue valueWithPointer:@selector(boxLayoutVertical)], nil],
                              nil];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.demoSelectors count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.demoSelectors objectAtIndex:indexPath.row] objectAtIndex:0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *item = [self.demoSelectors objectAtIndex:indexPath.row];
    self.detailViewController.title = [item objectAtIndex:0];
    SEL selector = [[item objectAtIndex:1] pointerValue];
    [self.detailViewController performSelector:selector];
    [self.detailViewController.masterPopoverController dismissPopoverAnimated:TRUE];
    
}

@end
