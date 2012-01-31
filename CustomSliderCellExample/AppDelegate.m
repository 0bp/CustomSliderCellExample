#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  data = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", nil];
}

#pragma mark NSTableView Datasource Methods

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
  if([[tableColumn dataCell] class] == [CustomSliderCell class])
  {
    return [data objectAtIndex:row];
  }
  return @"Cell";
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
  return 3;
}

-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{ 
  if([[tableColumn dataCell] class] == [CustomSliderCell class])
  {
    NSLog(@"FOo %@", object);
    [data replaceObjectAtIndex:row withObject:object];
  }
}

@end
