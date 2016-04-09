//
//  MainLoginViewController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/7.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "MainLoginViewController.h"
#import "MainLoginView.h"
#import "PasscodeController.h"

@interface MainLoginViewController()
/**
 *  main view
 */
@property(nonatomic, retain) MainLoginView *mainView;
@end

@implementation MainLoginViewController
#pragma mark getters and setters
- (MainLoginView *) mainView{
    if(!_mainView){
        _mainView = [[MainLoginView alloc] init];
        /**
         *  login Buton click
         */
        WS(weakSelf);
        _mainView.onLoginButtonClick = ^(UIButton *sender){
            NSLog(@"login");
            //TODO: 判断是否第一次登录（如果第一次登录需要设置密码，如果不是第一次登录则跳转主页面）
            PasscodeController *passcodeVC = [[PasscodeController alloc] init];
            [weakSelf.navigationController pushViewController: passcodeVC animated: YES];
        };
    }
    return _mainView;
}

#pragma mark - load
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview: self.mainView];
}
@end
