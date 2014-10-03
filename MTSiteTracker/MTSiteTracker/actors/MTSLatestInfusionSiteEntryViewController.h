//
//  MTSLatestInfusionSiteEntryViewController.h
//  MTSiteTracker
//
//  Created by Pavel Yeshchyk on 9/30/14.
//  Copyright (c) 2014 py. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTPanel.h"

@interface MTSLatestInfusionSiteEntryViewController : UIViewController

@property (nonatomic, strong)IBOutlet UIButton *historyButton;
@property (nonatomic, strong)IBOutlet UIView *webViewContainer;
@property (nonatomic, strong)IBOutlet UIWebView *webView;
@property (nonatomic, strong)IBOutlet MTPanel *mtPanel;

@end
