//
//  MTSLatestInfusionSiteEntryViewController.m
//  MTSiteTracker
//
//  Created by Pavel Yeshchyk on 9/30/14.
//  Copyright (c) 2014 py. All rights reserved.
//

#import "MTSLatestInfusionSiteEntryViewController.h"
#import "MYMPanelsFactory.h"
#import "MTAttributedStrings.h"

@interface MTSLatestInfusionSiteEntryViewController () <UIWebViewDelegate>

@property (nonatomic, weak)IBOutlet NSLayoutConstraint *panelHeightConstraint;
@end

@implementation MTSLatestInfusionSiteEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.webView loadHTMLString:@"<html><body>Rorem</body></html>" baseURL:nil];
    [self.webView.scrollView setScrollEnabled:NO];
    [MYMPanelsFactory configureAsLatestInfusionSetPanel:self.mtPanel];
    [self.historyButton setAttributedTitle:[MTAttributedStrings infusionSiteHistory] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.webView sizeToFit];
    CGSize size = self.webView.scrollView.contentSize;
    [self.mtPanel setViewToDisplaySize:size];
}

@end
