//
//  PasscodeController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "PasscodeController.h"
#import "MainPasscodeView.h"
#import "PasscodeService.h"
#import "AppDelegate.h"
#import "BaseTabBarController.h"

@interface PasscodeController()
/**
 *  main view
 */
@property(nonatomic, strong) MainPasscodeView *mainView;

/**
 *  main service
 */
@property(nonatomic, strong) PasscodeService *mainService;
@end

@implementation PasscodeController
#pragma mark - getters and setters
- (MainPasscodeView *)mainView{
    if(!_mainView){
        _mainView = [[MainPasscodeView alloc] init];
        WS(weakSelf);
        _mainView.onNextStepButtonClick = ^(UIButton *sender){
            [weakSelf.mainService touchIDAuthentican:^(BOOL success, NSError *error) {
                NSLog(@"success");
            } fail:^{
                [TOASTVIEW showWithText: @"Your device is not supported Touch ID."];
                dispatch_async(dispatch_get_main_queue(), ^{
                    //test into homePage
                    ((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController = [[BaseTabBarController alloc] init];
                });
            }];
        };
    }
    return _mainView;
}

- (PasscodeService *)mainService{
    if(!_mainService){
        _mainService = [[PasscodeService alloc] init];
    }
    return _mainService;
}

#pragma mark - load
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview: self.mainView];
    [self.navigationItem setRightBarButtonItem: [self.mainView showNextButtonInBarButtonItem]];
}
@end
