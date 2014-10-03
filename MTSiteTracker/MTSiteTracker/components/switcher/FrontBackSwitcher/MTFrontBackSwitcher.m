//
//  MTFrontBackSwitcher.h
//  MedTracker
//
//  Created by Paul on 10/1/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//


#import "MTFrontBackSwitcher.h"

@interface MTFrontBackSwitcher ()
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) UISwipeGestureRecognizer *swipeToLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeToRight;
@property (nonatomic, strong) UITapGestureRecognizer *tap;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *switcherImage;
@property (weak, nonatomic) IBOutlet UILabel *switcherTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *offTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *onTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *switcherXAlignementConstraint;
@property (weak, nonatomic) IBOutlet UIView *switchIndicator;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *switcherOffCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *switcherOnCenterConstraint;

@property (copy, nonatomic) NSString *offTitle;
@property (copy, nonatomic) NSString *onTitle;

@end

@implementation MTFrontBackSwitcher


- (void)initCommon {
    
    
    self.backgroundImage.image = [[UIImage imageNamed:@"LGISwitchBackgroundImage"] resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    
    self.switcherImage.image = [[UIImage imageNamed:@"LGISwitcherIcon"] resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    
    // Initialize the switch
    [self updateState];
    
    [self addGestures];
}

- (void)awakeFromNib {
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MTFrontBackSwitcher class]) owner:self options:nil];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    
    [self initCommon];
}

- (void)setOnTitleText:(NSString *)text {
    self.onTitle = text;
    self.onTitleLabel.text = text;
    [self updateState];
}

- (void)setOffTitleText:(NSString *)text {
    self.offTitle = text;
    self.offTitleLabel.text = text;
    [self updateState];
}

- (void)setOn:(BOOL)on {
    _on = on;
    
    [self updateState];
}

- (void)updateState {

    NSString *newTitleText = nil;
    
    if ([self isOn]) {
        self.onTitleLabel.enabled = YES;
        self.offTitleLabel.enabled = NO;
        newTitleText = self.onTitle;
        self.switcherXAlignementConstraint.constant = (CGRectGetWidth(self.bounds)/2- CGRectGetWidth(self.switchIndicator.bounds) / 2);
    } else {
        self.onTitleLabel.enabled = NO;
        self.offTitleLabel.enabled = YES;
        newTitleText = self.offTitle;
        self.switcherXAlignementConstraint.constant = - CGRectGetWidth(self.bounds)/2+CGRectGetWidth(self.switchIndicator.bounds) / 2;
    }
    
    self.switcherTitleLabel.alpha = 0.0f;
    self.switcherTitleLabel.text = newTitleText;
    self.switcherTitleLabel.alpha = 1.0f;
    
    [self layoutIfNeeded];
}

#pragma mark - Gesture methods

- (void)addGestures {
    self.swipeToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                            action:@selector(swipe:)];
    self.swipeToRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(swipe:)];
    
    [self.swipeToLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.swipeToRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(tap:)];
    self.tap.numberOfTapsRequired = 1;
    
    [self addGestureRecognizer:self.swipeToLeft];
    [self addGestureRecognizer:self.swipeToRight];
    [self addGestureRecognizer:self.tap];
}

- (void)swipe:(UISwipeGestureRecognizer *)swipeGesture {
    [UIView animateWithDuration:0.25
                     animations:^{
                         [self setOn:!self.isOn];
                     }
                     completion:^(BOOL finished) {
                         [self sendActionsForControlEvents:UIControlEventValueChanged];
                         [self sendActionsForControlEvents:UIControlEventTouchUpInside];
                     }];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    
    [UIView animateWithDuration:0.25f animations:^{
        [self setOn:!self.isOn];
    } completion:^(BOOL finished) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
    }];
}

@end
