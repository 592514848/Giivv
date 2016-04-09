//
//  MainPasscodeView.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPasscodeView : UIView
/**
 *  next button click block
 */
@property(nonatomic, copy) void (^onNextStepButtonClick)(UIButton *sender);

/**
 *  publick method
 */
- (UIBarButtonItem *)showNextButtonInBarButtonItem;
@end
