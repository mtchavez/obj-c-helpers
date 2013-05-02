//
//  CustomCellBackground.m
//  SportsPicks
//
//  Created by Matt Gallagher on 27/04/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import "CustomCellBackground.h"
#import "RoundRect.h"

@implementation CustomCellBackground

@synthesize strokeColor;
@synthesize contentColor;

//
// init
//
// Init method for the object.
//
- (id)init
{
	self = [super init];
	if (self != nil)
	{
		self.backgroundColor = [UIColor clearColor];
		self.strokeColor = [UIColor grayColor];
		self.contentColor = [UIColor colorWithWhite:0.05 alpha:0.80];
	}
	return self;
}


//
// drawRect:
//
// Draw the view.
//
- (void)drawRect:(CGRect)rect
{
	rect.origin.y += 1;
	rect.origin.x += 1;
	rect.size.width -= 2;
	rect.size.height -= 1;
	
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSaveGState(context);
	CGContextClipToRect(context, rect);
	
	UITableViewCell *cell = (UITableViewCell *)self.superview;
	UITableView *tableView = (UITableView *)self.superview.superview;
	NSIndexPath *indexPath = [tableView indexPathForCell:cell];
	
	const CGFloat ROUND_RECT_CORNER_RADIUS = 11.0;

	if ([indexPath row] != 0)
	{
		rect.origin.y -= ROUND_RECT_CORNER_RADIUS;
		rect.size.height += ROUND_RECT_CORNER_RADIUS;
	}
	if ([indexPath row] != [tableView numberOfRowsInSection:[indexPath section]] - 1)
	{
		rect.size.height += ROUND_RECT_CORNER_RADIUS;
	}
	
	rect = CGRectInset(rect, 0.5, 0.5);
	
	CGPathRef roundRectPath = NewPathWithRoundRect(rect, ROUND_RECT_CORNER_RADIUS);
	
	CGContextSetFillColorWithColor(context, contentColor.CGColor);
	CGContextAddPath(context, roundRectPath);
	CGContextFillPath(context);

	CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
	CGContextAddPath(context, roundRectPath);
	CGContextStrokePath(context);
	
	CGPathRelease(roundRectPath);
	
	CGContextRestoreGState(context);
	
	if ([indexPath row] != 0)
	{
		rect.origin.y += ROUND_RECT_CORNER_RADIUS - 1;
		rect.size.height -= ROUND_RECT_CORNER_RADIUS;

		CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
		CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
		CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
		CGContextStrokePath(context);
	}
}

//
// dealloc
//
// Releases instance memory.
//
- (void)dealloc
{
	[contentColor release];
	[strokeColor release];
	[super dealloc];
}

@end




