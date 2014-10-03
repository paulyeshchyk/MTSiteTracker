//
//  MTPanel.h
//  MedTracker
//
//  Created by Paul on 10/1/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTPanel : UIView

@property (copy, nonatomic) NSString *mtText;
@property (copy, nonatomic) UIFont *mtTextFont;
@property (copy, nonatomic) UIColor *mtTextColor;
@property (assign, nonatomic) UIOffset mtTextOffset;
@property (copy, nonatomic) UIColor *mtBorderColor;
@property (copy, nonatomic) UIColor *mtSeparatorColor;
@property (copy, nonatomic) UIColor *mtContainerColor;
@property (copy, nonatomic) UIColor *mtContainerBorderColor;
@property (assign, nonatomic) CGFloat mtContainerBorderThikness;

@property (assign, nonatomic) UIEdgeInsets mtSeparatorInsets;
@property (assign, nonatomic) UIEdgeInsets mtContainerInsets;
@property (assign, nonatomic) UIEdgeInsets mtViewToDisplayInsets;
@property (assign, nonatomic) CGFloat mtSeparatorHeight;
@property (assign, nonatomic) CGFloat mtBorderThickness;

@property (strong, nonatomic) IBOutlet UIView *viewToDisplay;
@end
