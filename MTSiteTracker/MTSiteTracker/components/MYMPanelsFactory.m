//
//  MYMPanelsFactory.m
//  medtronic
//
//  Created by Paul on 10/2/14.
//  Copyright (c) 2014 Pavel Yeshchyk. All rights reserved.
//

#import "MYMPanelsFactory.h"

@implementation MYMPanelsFactory

+ (MTPanel *)configureAsLatestInfusionSetPanel:(MTPanel *)panel{
 
    [panel setMtText:@"LATEST INFUSION SITE ENTRY"];
    [panel setMtTextFont:[UIFont boldSystemFontOfSize:18.0f]];
    [panel setMtSeparatorColor:[UIColor colorWithRed:100.0f/255.0f green:165.0f/255.0f blue:165.0f/255.0f alpha:1.0f]];
    [panel setMtTextColor:[UIColor colorWithRed:15.0f/255.0f green:100.0f/255.0f blue:150.0f/255.0f alpha:1.0f]];
    [panel setMtContainerBorderColor:[UIColor colorWithRed:108.0f/255.0f green:166.0f/255.0f blue:166.0f/255.0f alpha:1.0f]];
    [panel setMtContainerBorderThikness:1.0f];
    [panel setMtContainerColor:[UIColor colorWithRed:211.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1.0f]];
    [panel setMtViewToDisplayInsets:UIEdgeInsetsMake(10,10,10,10)];
    
    return panel;
}
@end
