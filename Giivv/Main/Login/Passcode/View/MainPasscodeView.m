//
//  MainPasscodeView.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//
#define MARGIN 15.0f
#import "MainPasscodeView.h"

@interface MainPasscodeView()
/**
 *  next step button
 */
@property(nonatomic, strong) UIButton *nextStepButton;
@end

@implementation MainPasscodeView
#pragma mark - getters and setters
- (UIButton *)nextStepButton{
    if(!_nextStepButton){
        _nextStepButton = [[UIButton alloc] initWithFrame: CGRectMake(10.0f, 0.0f, 80.0f, 40.0f)];
        [_nextStepButton setTitle: @"Next" forState: UIControlStateNormal];
        [_nextStepButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
        [_nextStepButton addTarget: self action: @selector(nextStepButtonClick:) forControlEvents: UIControlEventTouchUpInside];
    }
    return _nextStepButton;
}

#pragma mark - init
- (id)init{
    self = [super init];
    if(self){
        [self setBackgroundColor: [UIColor whiteColor]];
        [self setFrame: CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return self;
}

#pragma mark -
#pragma mark nextStepButtonClick
- (void)nextStepButtonClick:(UIButton *)sender{
    if(IsNilOrNull(self.onNextStepButtonClick)){
        return;
    }
    self.onNextStepButtonClick(sender);
}

#pragma mark -
#pragma mark public method
/**
 *  In the specified BarButtonitem display
 *
 *  @return barButtonItem
 */
- (UIBarButtonItem *)showNextButtonInBarButtonItem{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView: self.nextStepButton];
    return buttonItem;
}
@end
