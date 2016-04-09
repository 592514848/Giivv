//
//  PasscodeService.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "PasscodeService.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation PasscodeService
#pragma mark - Touch ID Authentican
/**
 *  Touch ID Authentican
 *
 *  @param canPolicy     enable policy block
 *  @param disablePolicy disable policy block
 */
- (void)touchIDAuthentican: (void (^)(BOOL success, NSError *error))canPolicy fail:(void (^)()) disablePolicy{
    LAContext *laContext = [[LAContext alloc] init];
    NSError *error;
    if (![laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        disablePolicy();
    }
    else {
        [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:@"Enable Touch ID and use your fingerprint to confirm payments with Giivv?"
                            reply:^(BOOL success, NSError *error) {
//                                //用户验证没有通过，比如提供了错误的手指的指纹
//                                LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,
//                                // 用户取消了Touch ID验证
//                                LAErrorUserCancel           = kLAErrorUserCancel,
//                                //用户不想进行Touch ID验证，想进行输入密码操作
//                                LAErrorUserFallback         = kLAErrorUserFallback,
//                                // 系统终止了验证
//                                LAErrorSystemCancel         = kLAErrorSystemCancel,
//                                // 用户没有在设备Settings中设定密码
//                                LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,
//                                // 设备不支持Touch ID
//                                LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,
//                                // 设备没有进行Touch ID 指纹注册
//                                LAErrorTouchID  NotEnrolled   = kLAErrorTouchIDNotEnrolled,
                                if(success){
                                    canPolicy(success, error);
                                }
                                else{
                                    switch (error.code) {
                                        case kLAErrorAuthenticationFailed:
                                            [TOASTVIEW showWithText: @"User authentication failed, such as providing the wrong finger fingerprint"];
                                            break;
                                        default:
                                            break;
                                    }
                                }
                            }];
    }
}
@end
