#import "CustomSliderCell.h"

@implementation CustomSliderCell

- (NSColor *)highlightColorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
  return nil;
}

-(NSRect)knobRectFlipped:(BOOL)flipped
{
  CGFloat value = [self intValue];
  NSRect myRect = NSMakeRect(0, 0, 0, 0);
  
  myRect.size.width = self.trackRect.size.height-2;
  myRect.size.height = self.trackRect.size.height-2;
  myRect.origin.x = (value * (self.trackRect.size.width-2 - myRect.size.width))+2;
  myRect.origin.y = self.trackRect.origin.y+1;
  
  return myRect;
}

-(void)drawKnob:(NSRect)knobRect
{
  NSRect innerRect = knobRect;
  innerRect.origin.x += 1;
  innerRect.origin.y += 1;
  innerRect.size.width -= 2;
  innerRect.size.height -=2;
  
  NSBezierPath * clipShape = [NSBezierPath bezierPath];
  [clipShape appendBezierPathWithRoundedRect:knobRect xRadius:20 yRadius:20];

  NSBezierPath * innerShape = [NSBezierPath bezierPath]; 
  [innerShape appendBezierPathWithRoundedRect:innerRect xRadius:20 yRadius:20];
  
  NSColor *knobBorderLight = [NSColor whiteColor];
  NSColor *knobTopColor    = [NSColor colorWithSRGBRed:0.72f green:0.72f blue:0.72f alpha:1.0f];
  NSColor *knobBottomColor = [NSColor whiteColor];
  
  NSGradient * knobBorder = [[NSGradient alloc] initWithColorsAndLocations:knobBorderLight, 0.0f, nil];
  
  NSGradient * knobGradient = [[NSGradient alloc]
                               initWithColorsAndLocations:
                               knobTopColor, 0.0f,
                               knobBottomColor, 1.0f,
                               nil];
  
  [knobBorder drawInBezierPath:clipShape angle:0];
  [knobGradient drawInBezierPath:innerShape angle:90.0f];  
}


- (void)drawBarInside:(NSRect)rect flipped:(BOOL)flipped
{
  NSBezierPath * barShape = [NSBezierPath bezierPath];
  [barShape appendBezierPathWithRoundedRect:rect xRadius:rect.size.height/2 yRadius:rect.size.height/2];
  
  NSGradient *fill = [[NSGradient alloc] initWithColorsAndLocations:
                      [NSColor colorWithCalibratedRed:0.247 green:0.251 blue:0.267 alpha:0.6],0.0f,
                      [NSColor colorWithCalibratedRed:0.227 green:0.227 blue:0.239 alpha:0.6],0.5f,
                      [NSColor colorWithCalibratedRed:0.180 green:0.188 blue:0.196 alpha:0.6],0.5f,
                      [NSColor colorWithCalibratedRed:0.137 green:0.137 blue:0.157 alpha:0.6],1.0f,
                      nil];
  
  [fill drawInBezierPath:barShape angle:-90.0];
  
  [[NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:0.3] set];
  [barShape stroke];
  
  /* Draw Text */
  CGFloat fontSize = 9.0f;
  NSString * fontName = @"Helvetica";
  NSString * message;
  
  if([self intValue] == 1) {
    message = @"ON";
  } else {
    message = @"OFF";
  }
  
  
  NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSFont fontWithName:fontName size:fontSize], NSFontAttributeName,
                               [NSColor grayColor], NSForegroundColorAttributeName,
                               nil];
  
  NSAttributedString * currentText = [[NSAttributedString alloc] initWithString:message attributes: attributes];
  
  NSPoint textPt;
  if([self intValue] == 1) {
    textPt = NSMakePoint(rect.origin.x+7, rect.origin.y+4);
  } else {
    textPt = NSMakePoint(rect.origin.x+21, rect.origin.y+4);  
  }
  
  [currentText drawAtPoint:textPt];
}

-(NSRect)rectOfTickMarkAtIndex:(NSInteger)index
{
  return NSMakeRect(0, 0, 0, 0);
}

- (BOOL)_usesCustomTrackImage 
{
  return YES;
}


@end
