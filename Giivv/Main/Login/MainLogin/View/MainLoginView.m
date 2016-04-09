//
//  MainLoginView.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//
#define MARGIN 30.0F
#define BUTTON_HEIGHT 50.0F
#import "MainLoginView.h"
@interface MainLoginView()
@property(nonatomic, strong) UIButton *loginButton;
@end

@implementation MainLoginView
#pragma mark - getters and setters
- (UIButton *)loginButton{
    if(!_loginButton){
        _loginButton = [[UIButton alloc] init];
        [_loginButton setBackgroundColor: HEX_RGB(0xf0f0f0)];
        [_loginButton setTitle: @"Login" forState: UIControlStateNormal];
        [_loginButton addTarget: self action: @selector(loginButtonCLick:) forControlEvents: UIControlEventTouchUpInside];
    }
    return _loginButton;
}

#pragma mark - init
- (id)init{
    self = [super init];
    if(self){
        [self setFrame: CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self addSubview: self.loginButton];
        self.loginButton.sd_layout.leftSpaceToView(self, MARGIN).rightSpaceToView(self, MARGIN).heightIs(BUTTON_HEIGHT).topSpaceToView(self, MARGIN);
    }
    return self;
}

#pragma mark -
#pragma mark login button click
- (void)loginButtonCLick:(UIButton *) sender{
    if(IsNilOrNull(self.onLoginButtonClick)){
        return;
    }
    self.onLoginButtonClick(sender);
}
@end
