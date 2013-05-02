//
//  BadgeView.h
//
//  Created by Chavez on 5/27/10.
//  Copyright 2010 Chavez All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BadgeView : UIView {
	UIImage *badgeImg;
	NSString *category;
}

@property (nonatomic, retain) UIImage *badgeImg;
@property (nonatomic, retain) NSString *category;

@end
