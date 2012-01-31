#import <Cocoa/Cocoa.h>
#import "CustomSliderCell.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource> 
{
  NSMutableArray * data;
}

@property (assign) IBOutlet NSWindow *window;

@end
