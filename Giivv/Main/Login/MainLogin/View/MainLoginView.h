//
//  MainLoginView.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainLoginView : UIView
@property(nonatomic, copy) void (^onLoginButtonClick)(UIButton *sender);
@end
