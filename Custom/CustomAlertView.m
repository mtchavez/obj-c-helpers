//
//  CustomAlertView.m
//
//  Created by Chavez User on 12/6/10.
//  Copyright 2010 Chavez. All rights reserved.
//

#import "CustomAlertView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomAlertView

@synthesize backgroundImage, okButton, _delegate;

- (void)show {
	self.hidden = NO;

	CAKeyframeAnimation *animation = [CAKeyframeAnimation
									  animationWithKeyPath:@"transform"];

	CATransform3D scale1 = CATransform3DMakeScale(1.0, 1.0, 1);
    CATransform3D scale2 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale3 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale4 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale5 = CATransform3DMakeScale(1.0, 1.0, 1);

    NSArray *frameValues = [NSArray arrayWithObjects:
							[NSValue valueWithCATransform3D:scale1],
							[NSValue valueWithCATransform3D:scale2],
							[NSValue valueWithCATransform3D:scale3],
							[NSValue valueWithCATransform3D:scale4],
							[NSValue valueWithCATransform3D:scale5],
							nil];
    [animation setValues:frameValues];

    NSArray *frameTimes = [NSArray arrayWithObjects:
						   [NSNumber numberWithFloat:0.0],
						   [NSNumber numberWithFloat:0.3],
						   [NSNumber numberWithFloat:0.7],
						   [NSNumber numberWithFloat:0.9],
						   [NSNumber numberWithFloat:1.0],
						   nil];
    [animation setKeyTimes:frameTimes];

    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.3;

	[self.layer addAnimation:animation forKey:@"popup"];
}

- (void)hide {
	if ([self superview] != nil) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.75];
//		[UIView setAnimationDidStopSelector:@selector(removeFromSuperview)];

		self.alpha = 0.0;

		[UIView commitAnimations];
	}
}

- (IBAction)okPressed:(id)sender {
	[self alertOKPressed:sender];
	[self hide];
}

- (void)alertOKPressed:(id)sender {
	if (_delegate && [_delegate respondsToSelector:@selector(alertOKPressed:)])
		[_delegate alertOKPressed:sender];
}

-  (void)dealloc {
	self.backgroundImage.image = nil;
	self.backgroundImage = nil;
	self.okButton = nil;

	[super dealloc];
}

@end
