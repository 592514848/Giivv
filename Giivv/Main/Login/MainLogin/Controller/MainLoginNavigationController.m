//
//  MainLoginNavigationController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "MainLoginNavigationController.h"
#import "MainLoginViewController.h"

@implementation MainLoginNavigationController
#pragma mark - load
- (void)viewDidLoad{
    MainLoginViewController *mainLoginVC = [[MainLoginViewController alloc] init];
    [self pushViewController: mainLoginVC animated: YES];
}
@end
