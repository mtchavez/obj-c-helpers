//
//  BadgeView.m
//
//  Created by Chavez on 5/27/10.
//  Copyright 2010 Chavez All rights reserved.
//

#import "BadgeView.h"


@implementation BadgeView

@synthesize category;
@synthesize badgeImg;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	int textOffset = 0;
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSInteger materialCount = [[[prefs objectForKey:@"savedMaterials"] objectForKey:category] count];
	NSString *text = [NSString stringWithFormat:@"%d", materialCount];

	if (materialCount >= 10)
		textOffset = 4;

	// Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();

	// Draw a badge image
	CGContextSaveGState(context);
	[[UIImage imageNamed:@"badge.png"] drawInRect:rect];

	// Draw the text
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 12 - textOffset, 8);
	CGContextScaleCTM(context, 1.0, 1.0);

	[[UIColor whiteColor] setFill];
	[text drawInRect:rect withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13]];
	CGContextRestoreGState(context);
}


- (void)dealloc {
	[category release], category = nil;
	[badgeImg release], badgeImg = nil;
    [super dealloc];
}


@end
