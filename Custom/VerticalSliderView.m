//
//  VerticalSliderView.m
//  VerticalSlider
//
//  Created by Bradley O'Hearne on 10/5/10.
//  Copyright 2010 Big Hill Software LLC. All rights reserved.
//

#import "VerticalSliderView.h"

#define TOP_BOTTOM_MARGIN			40.0

@implementation VerticalSliderView

@synthesize slider;

- (void)awakeFromNib; 
{
	CGRect sliderFrame = [self sliderRect];
	slider = [[CustomSlider alloc]initWithFrame:sliderFrame];
	[self addSubview:slider];	
}

- (id)initWithFrame:(CGRect)frame;
{
    if ((self = [super initWithFrame:frame]))
	{
		CGRect sliderFrame = [self sliderRect];
		slider = [[CustomSlider alloc]initWithFrame:sliderFrame];
		[self addSubview:slider];
    }
	
    return self;
}

- (void)drawRect:(CGRect)rect;
{
	CGRect sliderFrame = [self sliderRect];	
	slider.frame = sliderFrame;

	// transform the slider
	double radians = (-90.0 / 180.0 * M_PI);
	CGAffineTransform sliderTransform = CGAffineTransformMakeRotation(radians); 
	slider.transform = sliderTransform;
}

- (CGRect)sliderRect;
{
	//return CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
	double width = self.frame.size.height - (TOP_BOTTOM_MARGIN * 2.0);
	double height = 23.0;
	double x = (self.frame.size.width - width) / 2.0;
	double y = (self.frame.size.height - height) / 2.0;
	return CGRectMake(x, y, width, height);
	//return CGRectMake(0.0, 0.0, self.frame.size.height, self.frame.size.height);
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {
	return CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width + 40, bounds.size.height + 40);
}

- (void)dealloc;
{
	self.slider = nil;
    [super dealloc];
}


@end
