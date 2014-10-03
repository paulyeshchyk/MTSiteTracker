//
//  MYMPanelsFactory.h
//  medtronic
//
//  Created by Paul on 10/2/14.
//  Copyright (c) 2014 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTPanel.h"

@interface MYMPanelsFactory : NSObject

+ (MTPanel *)configureAsLatestInfusionSetPanel:(MTPanel *)panel;

@end
