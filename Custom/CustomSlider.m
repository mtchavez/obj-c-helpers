//
//  CustomSlider.m
//
//  Created by Chavez User on 12/3/10.
//  Copyright 2010 Chavez. All rights reserved.
//

#import "CustomSlider.h"

#define SLIDER_X_BOUND 50
#define SLIDER_Y_BOUND 50

@implementation CustomSlider

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {
    CGRect result = [super thumbRectForBounds:bounds trackRect:rect value:value];
    lastBounds = result;

    return result;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView* result = [super hitTest:point withEvent:event];
    if (result != self) {
        // check if this is within what we consider a reasonable range. It will for x as x is the whole slider
        if ((point.y >= -25) && (point.y < (lastBounds.size.height + 30)) && point.x > lastBounds.origin.x - 30) {
            result = self;
        }
    }

	if (result != self)
		result = nil;

    NSLog(@"UISlider(%d).hitTest: (%f, %f) result=%d", self, point.x, point.y, result);

    return result;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL result = [super pointInside:point withEvent:event];

    if (!result) {

        // check if this is within what we consider a reasonable range for just the ball
        if ((point.x >= (lastBounds.origin.x - SLIDER_X_BOUND)) && (point.x <= (lastBounds.origin.x + lastBounds.size.width + SLIDER_X_BOUND))
            && (point.y >= -25) && (point.y < (lastBounds.size.height + SLIDER_Y_BOUND))) {

            result = YES;
        }
    }

    NSLog(@"UISlider(%d).pointInside: (%f, %f) result=%d", self, point.x, point.y, result);

    return result;
}

@end
