//
//  MTMaleFemaleSwitcher.h
//  MedTracker
//
//  Created by Paul on 10/1/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface MTMaleFemaleSwitcher : UIControl

@property(nonatomic, readwrite, assign, getter = isOn, setter = setOn:) BOOL on;

- (void)setOnTitleText:(NSString *)text;

- (void)setOffTitleText:(NSString *)text;

@end
