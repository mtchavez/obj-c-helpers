//
//  CustomAlertView.h
//
//  Created by Chavez User on 12/6/10.
//  Copyright 2010 Chavez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomAlertViewDelegate

@optional

- (void)alertOKPressed:(id)sender;

@end


@interface CustomAlertView : UIView <CustomAlertViewDelegate> {
	UIImageView *backgroundImage;
	UIButton *okButton;
	id _delegate;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UIButton *okButton;
@property (nonatomic, retain) id _delegate;

- (void)show;
- (void)hide;
- (IBAction)okPressed:(id)sender;

@end
