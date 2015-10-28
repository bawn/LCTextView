//
//  LCTextView.h
//  LCTextViewDemo
//
//  Created by bawn on 10/28/15.
//  Copyright © 2015 bawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCTextView : UITextView

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;
@property (nonatomic, assign) IBInspectable CGFloat placeholderFontSize;
@property (nonatomic, assign) IBInspectable CGFloat topConstant;
@property (nonatomic, assign) IBInspectable CGFloat leadingConstant;

@end
