//
//  BaseViewController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/7.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    /**
     *  Make the page layout from under the navigation bar
     */
    self.navigationController.navigationBar.translucent = NO;
    /**
     *  When using this way, when hidden TabBar will leave black bar at the bottom
     */
//    [self setEdgesForExtendedLayout: UIRectEdgeNone];
//    self.automaticallyAdjustsScrollViewInsets = NO;
}
@end
