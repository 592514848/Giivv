//
//  BaseNavigationController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/7.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "BaseNavigationController.h"
@interface BaseNavigationController()
/**
 *  screen snapshot array
 */
@property(nonatomic, strong)NSMutableArray *screenShotsList;

/**
 *  background view
 */
@property(nonatomic, strong)UIView *backgroundView;
/**
 *  black mask view
 */
@property(nonatomic, strong)UIView *maskView;
/**
 *  start point
 */
@property(nonatomic, assign)CGPoint startTouchPoint;
/**
 *  Whether on the move
 */
@property(nonatomic, assign)BOOL isMoving;
/**
 *  The last screenshot
 */
@property(nonatomic, strong)UIImageView *lastScreenShotView;
@end

@implementation BaseNavigationController
#pragma mark - getters and setters
- (NSMutableArray *)screenShotsList{
    if(!_screenShotsList){
        _screenShotsList = [NSMutableArray array];
    }
    return _screenShotsList;
}

- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = [[UIView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        /**
         *  Tips: Here don't backgroundView added to the window, otherwise backgroundView has been suspended in the self.view
         */
        [self.view.superview insertSubview: self.backgroundView belowSubview: self.view];
        [_backgroundView addSubview: self.maskView];
    }
    return _backgroundView;
}

- (UIView *)maskView{
    if(!_maskView){
        _maskView = [[UIView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        [_maskView setBackgroundColor: [UIColor blackColor]];
    }
    return _maskView;
}

- (UIImageView *)lastScreenShotView{
    if(!_lastScreenShotView){
        _lastScreenShotView = [[UIImageView alloc] init];
    }
    return _lastScreenShotView;
}

#pragma mark - load
- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  add gesture
     */
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(handleSwipeGesture:)];
    [self.view addGestureRecognizer: panGestureRecognizer];
}

#pragma mark -
#pragma mark Lateral spreads gestures
- (void)handleSwipeGesture:(UIGestureRecognizer *)sender
{
    if (self.viewControllers.count <= 1){
        return;
    }
    CGPoint translation=[sender locationInView: WINDOW];
    if(sender.state == UIGestureRecognizerStateBegan){
        self.startTouchPoint = translation;
        self.isMoving = YES;
        
        [self.backgroundView setHidden: NO];
        if (self.lastScreenShotView)
            [self.lastScreenShotView removeFromSuperview];
        UIImage *lastScreenShot = [self.screenShotsList lastObject];
        self.lastScreenShotView = [[UIImageView alloc] initWithImage: lastScreenShot];
        [self.backgroundView insertSubview: self.lastScreenShotView belowSubview: self.maskView];
    }
    else if(sender.state == UIGestureRecognizerStateEnded){
        self.isMoving = NO;
        [self.backgroundView setHidden: NO];
        if (translation.x - self.startTouchPoint.x > 50.0f) {
            /**
             *  If the end of the coordinates is greater than the start moving coordinate 50 pixels is animation effects
             */
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewToX: self.view.frame.size.width];
            } completion:^(BOOL finished) {
                if(finished){
                    /**
                     *  The return on a layer and reduction points
                     */
                    [self popViewControllerAnimated: NO];
                    [self.view setLeft: 0.0f];
                    [self.backgroundView setHidden: YES];
                }
            }];
        }
        else{
            /**
             *  No more than 50 when they move in place
             */
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewToX: 0.0f];
            } completion:^(BOOL finished) {
                [self.backgroundView setHidden: YES];
            }];
        }
        return;
    }
    if (self.isMoving) {
        [self moveViewToX:translation.x - self.startTouchPoint.x];
    }
}

#pragma mark -
#pragma mark Move to the specified coordinates x
- (void)moveViewToX:(float) origin_x
{
    origin_x = origin_x > self.view.width ? self.view.height : origin_x;
    origin_x = origin_x < 0.0f ? 0.0f : origin_x;
    [self.view setLeft: origin_x];
    /**
     *  zooming value
     */
    float scale = (origin_x / 6400) + 0.95;
    /**
     *  alpha value
     */
    float alpha = 0.4 - (origin_x / 800);
    [self.lastScreenShotView setTransform: CGAffineTransformMakeScale(scale, scale)];
    [self.maskView setAlpha: alpha];
}

#pragma mark - The conversion of a UIView into a UIImage and realize the screenshots
- (UIImage *)ViewRenderImage
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark -
#pragma mark UINavigationController Delegate
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /**
     *  Image array deposit in a current interface image, and then push
     */
    [self.screenShotsList addObject:[self ViewRenderImage]];
    /**
     *  From the root view push on to the next hid tabBar viewcontroller
     */
    if(self.viewControllers.count > 0){
        [UIView animateWithDuration: 0.3f animations:^{
            [self.tabBarController.tabBar setTop: SCREEN_HEIGHT];
        }];
    }
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    /**
     *  Remove the last interface image
     */
    [self.screenShotsList removeLastObject];
    /**
     *  When back to the root view shows the tabbar
     */
    if(self.viewControllers.count == 2){
        [UIView animateWithDuration: 0.3f animations:^{
            [self.tabBarController.tabBar setTop: SCREEN_HEIGHT - TABBAR_HEIGHT];
        }];
    }
    return [super popViewControllerAnimated: animated];
}

@end
