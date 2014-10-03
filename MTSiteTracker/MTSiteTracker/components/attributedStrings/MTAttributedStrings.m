//
//  MTAttributedStrings.m
//  MTSiteTracker
//
//  Created by Pavel Yeshchyk on 10/2/14.
//  Copyright (c) 2014 py. All rights reserved.
//

#import "MTAttributedStrings.h"

@implementation MTAttributedStrings

+ (NSAttributedString *)infusionSiteHistory {

    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    UIImage *image = [UIImage imageNamed:@"clock_28x28.png"];
    [attachment setImage:image];
    
    NSMutableParagraphStyle *leftParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    leftParagraphStyle.alignment = NSTextAlignmentLeft;
    leftParagraphStyle.paragraphSpacing = 0;
    leftParagraphStyle.lineSpacing = -10;
//    leftParagraphStyle.paragraphSpacingBefore = -10;

    NSMutableParagraphStyle *rightParagraphStyle = [[NSMutableParagraphStyle alloc] init];
//    rightParagraphStyle.alignment = NSTextAlignmentRight;

    NSDictionary *imageAttributes = @{NSParagraphStyleAttributeName:rightParagraphStyle};
    NSMutableAttributedString *stringWithImage = [[NSMutableAttributedString alloc] initWithString:@" " attributes:imageAttributes];
    [stringWithImage appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];

    
    NSDictionary *textAttributes = @{NSParagraphStyleAttributeName:leftParagraphStyle,NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f]};
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:@"Infusion\nSite History" attributes:textAttributes];
    
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
    [result appendAttributedString:text];
//    [result appendAttributedString:stringWithImage];
    
    return result;
}

+ (NSAttributedString *)enterInfusionSite {
    return nil;
}

@end
