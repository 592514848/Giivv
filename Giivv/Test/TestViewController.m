//
//  TestViewController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/4.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "TestViewController.h"
#import <TwitterCore/TwitterCore.h>
#import <TwitterKit/TwitterKit.h>

/**
 *  facebook sdk
 */
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@implementation TestViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    
    UIButton *shareButton = [[UIButton alloc] initWithFrame: CGRectMake(50.0f, 50.0f, 100.0f, 30.0f)];
    [shareButton setBackgroundColor: [UIColor brownColor]];
    [shareButton setTitle: @"Twitter分享" forState: UIControlStateNormal];
    [shareButton addTarget: self action: @selector(twitterShare) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: shareButton];
    
    UIButton *loginButtonClick = [[UIButton alloc] initWithFrame: CGRectMake(50, 100.0f, 100.0f, 30.0f)];
    [loginButtonClick setBackgroundColor: [UIColor brownColor]];
    [loginButtonClick setTitle: @"Twitter登录" forState: UIControlStateNormal];
    [loginButtonClick addTarget: self action: @selector(twitterLogin) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: loginButtonClick];
    
    shareButton = [[UIButton alloc] initWithFrame: CGRectMake(50.0f, 150.0f, 150.0f, 30.0f)];
    [shareButton setBackgroundColor: [UIColor brownColor]];
    [shareButton setTitle: @"FaceBook分享" forState: UIControlStateNormal];
    [shareButton addTarget: self action: @selector(facebookShare) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: shareButton];
    
    loginButtonClick = [[UIButton alloc] initWithFrame: CGRectMake(50, 200.0f, 150.0f, 30.0f)];
    [loginButtonClick setBackgroundColor: [UIColor brownColor]];
    [loginButtonClick setTitle: @"FaceBook登录" forState: UIControlStateNormal];
    [loginButtonClick addTarget: self action: @selector(facebookLogin) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: loginButtonClick];
    
    UIButton *pushButton = [[UIButton alloc] initWithFrame: CGRectMake(50, 250.0f, 150.0f, 30.0f)];
    [pushButton setBackgroundColor: [UIColor brownColor]];
    [pushButton setTitle: @"Push" forState: UIControlStateNormal];
    [pushButton addTarget: self action: @selector(pushButtonClick) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: pushButton];
}

#pragma mark - 
#pragma mark twitter share
- (void)twitterShare{
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText: @"测试"];
    UIImage *shareImage = [UIImage imageNamed: @"IMG_0884.JPG"];
    [composer setImage: shareImage];
    [composer showFromViewController: self completion:^(TWTRComposerResult result) {
        NSLog(@"%ld", (long)result);
    }];
}

#pragma mark - 
#pragma mark twitter login
- (void)twitterLogin{
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if(session){
            NSLog(@"signed in as %@", [session userName]);
        }
        else{
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
}

#pragma mark - 
#pragma mark facebook share
- (void)facebookShare{
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL =  [NSURL URLWithString: @"http://www.umeng.com/images/pic/home/4.0/partner/logo-netease.png"];
    [FBSDKShareDialog showFromViewController:self.parentViewController
                                 withContent: content
                                    delegate:nil];
}

#pragma mark -
#pragma mark facebook Login
- (void)facebookLogin{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
                 fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"Logged in");
                                }
                            }];
}

#pragma mark - 
#pragma mark push
- (void)pushButtonClick{
    TestViewController *vc = [[TestViewController alloc] init];
    [vc.tabBarController setHidesBottomBarWhenPushed: YES];
    [self.navigationController pushViewController: vc animated: YES];
}
@end
