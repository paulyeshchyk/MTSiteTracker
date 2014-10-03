//
//  MTPanel.m
//  MedTracker
//
//  Created by Paul on 10/1/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "MTPanel.h"

static CGFloat const kMTPanelSeparatorHeight = 2.0f;
static UIEdgeInsets const kMTPanelSeparatorInsets = {2.0f,2.0f,0.0f,2.0f};
static UIEdgeInsets const kMTPanelContainerInsets = {15.0f,0.0f,0.0f,0.0f};
static UIOffset const kMTPanelTextOffset = {3.0f,0.0f};
static CGFloat const kMTPanelCornerRadius = 2.0f;

@interface MTPanel ()

@property (strong, nonatomic) NSArray *customContraints;
@property (strong, nonatomic) UILabel *mtLabel;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIView *subContainerView;

@end

@implementation MTPanel

- (id)initWithFrame:(CGRect)frame {

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

- (void)setMtText:(NSString *)mtText {

	[self.mtLabel setText:mtText];
	[self setNeedsUpdateConstraints];
}

- (NSString *)mtText {
    
    return [self.mtLabel text];
}

- (void)setMtTextFont:(UIFont *)mtTextFont {

	[self.mtLabel setFont:mtTextFont];
	[self setNeedsUpdateConstraints];
}


- (UIFont *)mtTextFont {

    return [self.mtLabel font];
}

- (void)setMtTextColor:(UIColor *)mtTextColor {

	[self.mtLabel setTextColor:mtTextColor];
}

- (UIColor *)mtTextColor {
    
    return [self.mtLabel textColor];
}

- (void)setMtContainerColor:(UIColor *)mtContainerColor {
    [self.containerView setBackgroundColor:mtContainerColor];
}

- (UIColor *)mtContainerColor {
    
    return [self.containerView backgroundColor];
}

- (void)setMtContainerBorderColor:(UIColor *)mtContainerBorderColor {
    
    [self.subContainerView.layer setBorderColor:[mtContainerBorderColor CGColor]];
}

- (UIColor *)mtContainerBorderColor {
    
    return [UIColor colorWithCGColor:self.subContainerView.layer.borderColor];
}

- (void)setMtContainerInsets:(UIEdgeInsets)mtContainerInsets {
    
    _mtContainerInsets = mtContainerInsets;
    [self setNeedsUpdateConstraints];
}

- (void)setMtContainerBorderThikness:(CGFloat)mtContainerBorderThikness {
    
    [self.subContainerView.layer setBorderWidth:mtContainerBorderThikness];
}

- (CGFloat) mtContainerBorderThikness {
    
    return self.subContainerView.layer.borderWidth;
}

- (void)setMtBorderColor:(UIColor *)mtBorderColor {
	_mtBorderColor = [mtBorderColor copy];
	self.layer.borderColor = [_mtBorderColor CGColor];
}

- (void)setMtBorderThickness:(CGFloat)borderThickness {

	self.layer.borderWidth = borderThickness;
}

- (CGFloat)mtBorderThickness {

	return self.layer.borderWidth;
}

- (void)setMtSeparatorHeight:(CGFloat)mtSeparatorHeight {

    _mtSeparatorHeight = mtSeparatorHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setMtSeparatorColor:(UIColor *)mtSeparatorColor {
    
    [self.separatorView setBackgroundColor:mtSeparatorColor];
}

- (UIColor *)mtSeparatorColor {
    
    return [self.separatorView backgroundColor];
}

- (void)setMtSeparatorInsets:(UIEdgeInsets)mtSeparatorInsets {

    _mtSeparatorInsets = mtSeparatorInsets;
    [self setNeedsUpdateConstraints];
}

- (void)setMtViewToDisplayInsets:(UIEdgeInsets)mtViewToDisplayInsets {
    
    _mtViewToDisplayInsets = mtViewToDisplayInsets;
    [self setNeedsUpdateConstraints];
}

#pragma mark -
- (void)setup {

    self.separatorView = [[UIView alloc] init];
    [self.separatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.separatorView setBackgroundColor:self.mtSeparatorColor];
    [self addSubview:self.separatorView];
    
	self.mtLabel = [[UILabel alloc] init];
	[self.mtLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self.mtLabel setText:self.mtText];
	[self.mtLabel setTextColor:self.mtTextColor];
	[self.mtLabel setFont:self.mtTextFont];
    [self.mtLabel setNumberOfLines:0];
	[self addSubview:self.mtLabel];

    self.containerView = [[UIView alloc] init];
    [self.containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.containerView];
    self.containerView.layer.cornerRadius = kMTPanelCornerRadius;
    
    self.subContainerView = [[UIView alloc] init];
    [self.subContainerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.containerView addSubview:self.subContainerView];
    self.subContainerView.layer.cornerRadius = kMTPanelCornerRadius;
    
	self.mtBorderColor = self.backgroundColor;
	self.mtBorderThickness = 0.0f;
	self.mtTextFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    self.mtSeparatorInsets = kMTPanelSeparatorInsets;
    self.mtSeparatorHeight = kMTPanelSeparatorHeight;
    
    self.mtTextOffset = kMTPanelTextOffset;
    self.mtContainerInsets = kMTPanelContainerInsets;
}

- (void)setMtTextOffset:(UIOffset)mtTextOffset {
    
    _mtTextOffset = mtTextOffset;
    [self setNeedsUpdateConstraints];
    
}

- (void)setViewToDisplay:(UIView *)viewToDisplay {
    
    [viewToDisplay removeFromSuperview];
    
    if (self.subContainerView){
    
        [self.subContainerView removeConstraints:self.subContainerView.constraints];
        
        _viewToDisplay = viewToDisplay;
        [_viewToDisplay setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.subContainerView addSubview:viewToDisplay];

        NSDictionary *bindings = NSDictionaryOfVariableBindings(_viewToDisplay);
        NSMutableArray *customConstraints = [[NSMutableArray alloc] init];
        [customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_viewToDisplay]|" options:0 metrics:nil views:bindings]];
        [customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_viewToDisplay]|" options:0 metrics:nil views:bindings]];
        [self.subContainerView addConstraints:customConstraints];
        [self setNeedsUpdateConstraints];
    }
}

- (void)updateConstraints {
    
    [super updateConstraints];

	if (self.customContraints) {
        
		[self removeConstraints:self.customContraints];
	}

	self.customContraints = nil;
    UIView *viewToClipContainer = self;
    
    NSMutableArray *customConstraints = [[NSMutableArray alloc] init];
	if (_mtLabel) {

		CGRect rectForLabel = CGRectIntegral([self.mtText boundingRectWithSize:self.bounds.size
                                                                       options:NSLineBreakByWordWrapping | NSStringDrawingUsesLineFragmentOrigin
                                                                    attributes:@{ NSFontAttributeName: self.mtTextFont }
                                                                       context:NULL]);
        CGSize size = rectForLabel.size;
        if ((size.height * size.width) != 0) {

            NSDictionary *bindings = NSDictionaryOfVariableBindings(_mtLabel);

            NSDictionary *metrics = @{ @"top"   :@(_mtTextOffset.vertical),
                                       @"height":@(CGRectGetHeight(rectForLabel)),
                                       @"left"  :@(_mtTextOffset.horizontal),
                                       @"width" :@(CGRectGetWidth(rectForLabel)) };
            
            [customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[_mtLabel(height)]" options:0 metrics:metrics views:bindings]];
            [customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[_mtLabel(width)]" options:0 metrics:metrics views:bindings]];
            viewToClipContainer = _mtLabel;
        }

	}

    if (_separatorView && [customConstraints count] > 0) {
        
		NSDictionary *bindings = NSDictionaryOfVariableBindings(_separatorView,_mtLabel);
        NSDictionary *metrics = @{ @"top":@(self.mtSeparatorInsets.top),
                                   @"height":@(self.mtSeparatorHeight) ,
                                   @"left":@(self.mtSeparatorInsets.left),
                                   @"right":@(self.mtSeparatorInsets.right) };
        
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_mtLabel]-(top)-[_separatorView(height)]" options:0 metrics:metrics views:bindings]];
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[_separatorView]-(right)-|"     options:0   metrics:metrics views:bindings]];

        
        
        viewToClipContainer = _separatorView;
    }
    
    
    if (_containerView) {
        
		NSDictionary *bindings = NSDictionaryOfVariableBindings(viewToClipContainer,_containerView);
        NSDictionary *metrics = @{ @"top":@(self.mtContainerInsets.top),
                                   @"left":@(self.mtContainerInsets.left),
                                   @"right":@(self.mtContainerInsets.right) };
        
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[viewToClipContainer]-(top)-[_containerView]|" options:0 metrics:metrics views:bindings]];
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[_containerView]-(right)-|" options:0 metrics:metrics views:bindings]];
    }
    
    if (_viewToDisplay){
        
		NSDictionary *bindings = NSDictionaryOfVariableBindings(_subContainerView,_containerView);
        NSDictionary *metrics = @{ @"top":@(self.mtViewToDisplayInsets.top),
                                   @"left":@(self.mtViewToDisplayInsets.left),
                                   @"right":@(self.mtViewToDisplayInsets.right),
                                   @"bottom":@(self.mtViewToDisplayInsets.bottom) };
        
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[_subContainerView]-(bottom)-|" options:0 metrics:metrics views:bindings]];
		[customConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[_subContainerView]-(right)-|" options:0 metrics:metrics views:bindings]];
    }
    
    self.customContraints = [customConstraints copy];
    [self addConstraints:self.customContraints];
}

@end
