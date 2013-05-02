//
//  PDFViewController.h
//  dlc
//
//  Created by Chavez on 4/13/11.
//  Copyright 2011 Chavez All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectViewController.h"

@interface PDFViewController : ProjectViewController <UIWebViewDelegate> {
    UIWebView *webView;
    NSURL *url;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSURL *url;

@end
