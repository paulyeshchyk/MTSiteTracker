//
//  MTMaskedSwitcherIndicator.m
//  MTSiteTracker
//
//  Created by Pavel Yeshchyk on 10/3/14.
//  Copyright (c) 2014 py. All rights reserved.
//

#import "MTMaskedSwitcherIndicator.h"

@implementation MTMaskedSwitcherIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

- (void)setup {
//    self.layer.borderColor = [[UIColor whiteColor] CGColor];
//    self.layer.borderWidth = 1.0f;
//    self.layer.cornerRadius = 2.0f;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	// Draw a dark gray background
	[[UIColor clearColor] setFill];
	CGContextFillRect(context, rect);
    
	// Draw the text upside-down
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 0, rect.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	[[UIColor whiteColor] setFill];
	CGContextRestoreGState(context);
    
	// Create an image mask from what we've drawn so far
	CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
	// Draw a white background (overwriting the previous work)
	[[UIColor colorWithRed:78.0f/255.0f green:187.0f/255.0f blue:187.0f/255.0f alpha:0.9f] setFill];
	CGContextFillRect(context, rect);
    
    // Draw the image, clipped by the mask
	CGContextSaveGState(context);
	CGContextClipToMask(context, rect, alphaMask);
    
//	[[UIImage imageNamed:@"shuttle.jpg"] drawInRect:rect];
	CGContextRestoreGState(context);
	CGImageRelease(alphaMask);
}

@end
