
//
//  BaseTabBarController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/7.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "BaseTabBarController.h"
#import "TestViewController.h"
#import "HomePageViewController.h"

@interface BaseTabBarController()
/**
 *   tabbar titles
 */
@property(nonatomic, strong) NSArray *titleArray;
@end

@implementation BaseTabBarController
#pragma mark - getters and setters
- (NSArray *)titleArray{
    if(!_titleArray){
        _titleArray = @[@"Churches", @"NPO", @"Favorites", @"Settings"];
    }
    return _titleArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadViewControllers];
}

#pragma mark - load viewControllers
- (void)loadViewControllers{
    NSMutableArray *controllersArray = [NSMutableArray array];
    for(NSInteger i = 0; i < [self.titleArray count]; i++){
        BaseNavigationController *navigationController = [[BaseNavigationController alloc] init];
        HomePageViewController *test = [[HomePageViewController alloc] init];
        [test setTitle: [self.titleArray objectAtIndex: i]];
        [navigationController pushViewController: test animated: YES];
//        [navigationController.tabBarItem setImage: [[UIImage imageNamed:@"ic_product_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [navigationController.tabBarItem setSelectedImage: [[UIImage imageNamed:@"ic_product_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [navigationController.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0.0f, -4.0f)];
        [navigationController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil]forState:UIControlStateSelected];
        [controllersArray addObject: navigationController];
    }
    [self setViewControllers: controllersArray];
}
@end
