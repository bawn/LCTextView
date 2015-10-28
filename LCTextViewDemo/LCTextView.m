//
//  LCTextView.m
//  LCTextViewDemo
//
//  Created by bawn on 10/28/15.
//  Copyright © 2015 bawn. All rights reserved.
//

#import "LCTextView.h"

static NSString *const LCPlaceholderString = @"请输入";
static CGFloat const LCPlaceholderLeading = 10.0f;
static CGFloat const LCPlaceholderTop = 15.0f;
static CGFloat const LCLeadingOffset = 3.0f;

@interface LCTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) NSLayoutConstraint *placeholderTopCon;
@property (nonatomic, strong) NSLayoutConstraint *placeholderLeadingCon;

@end

@implementation LCTextView


- (instancetype)init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


- (void)awakeFromNib{
    [self initialize];
}


- (void)initialize{
    self.placeholderLabel = [[UILabel alloc] init];
    self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.placeholderLabel.text = _placeholder ? : LCPlaceholderString;
    self.placeholderLabel.textColor = _placeholderColor ? : [[UIColor grayColor] colorWithAlphaComponent:0.7f];
    self.placeholderLabel.font = [UIFont systemFontOfSize:_placeholderFontSize ? : 13.0f];
    [self addSubview:_placeholderLabel];
    self.placeholderLeadingCon = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:_leadingConstant ? : LCPlaceholderLeading];
    self.placeholderTopCon = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:_topConstant ? : LCPlaceholderTop];
    [self addConstraints:@[_placeholderTopCon, _placeholderLeadingCon]];
    [self changeContainerInset];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
}

- (void)changeContainerInset{
    self.textContainerInset = (UIEdgeInsets){_topConstant ? : LCPlaceholderTop, _leadingConstant ? _leadingConstant - LCLeadingOffset : LCPlaceholderLeading - LCLeadingOffset, 0.0f, 0.0f};
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = _placeholder ? : LCPlaceholderString;
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = _placeholderColor ? : [[UIColor grayColor] colorWithAlphaComponent:0.7f];
}

- (void)setPlaceholderFontSize:(CGFloat)placeholderFontSize{
    _placeholderFontSize = placeholderFontSize;
    self.placeholderLabel.font = [UIFont systemFontOfSize:_placeholderFontSize ? : 13.0f];
}

- (void)setTopConstant:(CGFloat)topConstant{
    _topConstant = topConstant;
    self.placeholderTopCon.constant = _topConstant;
    [self changeContainerInset];
}

- (void)setLeadingConstant:(CGFloat)leadingConstant{
    _leadingConstant = leadingConstant;
    self.placeholderLeadingCon.constant = _leadingConstant;
    [self changeContainerInset];
}

- (void)textDidChange:(NSNotification *)notification{
    self.placeholderLabel.hidden = self.text.length;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
