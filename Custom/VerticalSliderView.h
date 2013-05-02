//
//  VerticalSliderView.h
//  VerticalSlider
//
//  Created by Bradley O'Hearne on 10/5/10.
//  Copyright 2010 Big Hill Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSlider.h"

@interface VerticalSliderView : UIView {
	CustomSlider *slider;
}

@property (nonatomic, retain) IBOutlet CustomSlider *slider;

- (CGRect)sliderRect;

@end
