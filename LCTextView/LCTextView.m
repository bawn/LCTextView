//
//  LCTextView.m
//  LCTextViewDemo
//
//  Created by bawn on 10/28/15.
//  Copyright © 2015 bawn. All rights reserved.
//

#import "LCTextView.h"

static NSString *const LCPlaceholderString = @"请输入";
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
    [super awakeFromNib];
    [self initialize];
}


- (void)initialize{
    self.placeholderLabel = [[UILabel alloc] init];
    self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.placeholderLabel.text = _placeholder ? : LCPlaceholderString;
    self.placeholderLabel.textColor = _phColor ? : [[UIColor grayColor] colorWithAlphaComponent:0.7f];
    self.placeholderLabel.font = [UIFont systemFontOfSize:_phFontSize ? : 13.0f];
    [self addSubview:_placeholderLabel];
    
    self.placeholderLeadingCon = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:_leadingSpace];
    self.placeholderTopCon = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:_topSpace];
    [self addConstraints:@[_placeholderTopCon, _placeholderLeadingCon]];
    [self changeContainerInset];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"] && [change[NSKeyValueChangeNewKey] length]) {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setText:(NSString *)text{
    [super setText:text];
    if (text && text.length) {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    if (attributedText && [attributedText length]) {
        self.placeholderLabel.hidden = YES;
    }
}
- (void)changeContainerInset{
    self.textContainerInset = (UIEdgeInsets){_topSpace, _leadingSpace - LCLeadingOffset, 0.0f, _leadingSpace - LCLeadingOffset};
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = _placeholder ? : LCPlaceholderString;
}


- (void)setPhColor:(UIColor *)phColor{
    _phColor = phColor;
    self.placeholderLabel.textColor = _phColor ? : [[UIColor grayColor] colorWithAlphaComponent:0.7f];
}

- (void)setPhFontSize:(CGFloat)phFontSize{
    _phFontSize = phFontSize;
    self.placeholderLabel.font = [UIFont systemFontOfSize:_phFontSize ? : 13.0f];
}

- (void)setTopSpace:(CGFloat)topSpace{
    _topSpace = topSpace;
    self.placeholderTopCon.constant = _topSpace;
    [self changeContainerInset];

}

- (void)setLeadingSpace:(CGFloat)leadingSpace{
    _leadingSpace = leadingSpace;
    self.placeholderLeadingCon.constant = _leadingSpace;
    [self changeContainerInset];
}


- (void)textDidChange:(NSNotification *)notification{
    self.placeholderLabel.hidden = self.text.length;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutIfNeeded];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
