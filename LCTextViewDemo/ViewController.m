//
//  ViewController.m
//  LCTextViewDemo
//
//  Created by bawn on 10/28/15.
//  Copyright © 2015 bawn. All rights reserved.
//

#import "ViewController.h"
#import "LCTextView.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet LCTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.textView.leadingConstant = 10.0f;
//    self.textView.topConstant = 10.0f;
//    self.textView.placeholder = @"请输入";
//    self.textView.placeholderColor = [[UIColor grayColor] colorWithAlphaComponent:0.7f];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
