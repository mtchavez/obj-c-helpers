//
//  CustomCellBackground.h
//  SportsPicks
//
//  Created by Matt Gallagher on 27/04/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellBackground : UIView
{
	UIColor *contentColor;
	UIColor *strokeColor;
}

@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, retain) UIColor *contentColor;

@end




