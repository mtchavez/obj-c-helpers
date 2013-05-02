//
//  CustomButton.m
//  SportsPicks
//
//  Created by Matt Gallagher on 23/04/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import "CustomButton.h"


@implementation CustomButton

//
// initWithFrame:
//
// Init method for the object. Not used when waking from NIB.
//
- (id)initWithFrame:(CGRect)aFrame;
{
	self = [super initWithFrame:aFrame];
	if (self != nil)
	{
		[self awakeFromNib];
	}
	return self;
}


//
// awakeFromNib
//
// Sets the custom visual properties of the button.
//
- (void)awakeFromNib
{
	UIImage *buttonBackgroundImage = [UIImage imageNamed:@"button_background_normal.png"];
	UIImage *stretchableBackground =
		[buttonBackgroundImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:10.0];
	
	UIImage *buttonSelectedImage = [UIImage imageNamed:@"button_background_selected.png"];
	UIImage *stretchableSelected =
		[buttonSelectedImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:10.0];
	
	[self setBackgroundImage:stretchableBackground forState:UIControlStateNormal];
	[self setBackgroundImage:stretchableSelected forState:UIControlStateHighlighted];
	[self setBackgroundImage:stretchableSelected forState:UIControlStateDisabled];
	[self
		setTitleColor:[UIColor whiteColor]
		forState:UIControlStateNormal];
	[self
		setTitleColor:
			[UIColor
				colorWithRed:82.0/255.0
				green:92.0/255.0
				blue:105.0/255.0
				alpha:1.0]
		forState:UIControlStateHighlighted];
	[self
		setTitleColor:
			[UIColor
				colorWithRed:127.0/255.0
				green:127.0/255.0
				blue:127.0/255.0
				alpha:1.0]
		forState:UIControlStateDisabled];
}

@end
