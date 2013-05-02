//
//  PDFViewController.m
//  dlc
//
//  Created by Chavez on 4/13/11.
//  Copyright 2011 Chavez All rights reserved.
//

#import "PDFViewController.h"


@implementation PDFViewController

@synthesize webView, url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];

    webView = nil;
    url = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Calling Private Method on UIWebView so that zooming doesn't block main thread
    [webView performSelector:@selector(_setDrawInWebThread:) withObject:YES];

    webView.delegate = self;
    webView.scalesPageToFit = YES;

    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return YES;
    else
        return NO;
}

@end
