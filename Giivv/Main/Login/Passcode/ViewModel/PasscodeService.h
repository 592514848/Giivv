//
//  PasscodeService.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasscodeService : NSObject
/**
 *  public method
 */
- (void)touchIDAuthentican: (void (^)(BOOL success, NSError *error))canPolicy fail:(void (^)()) disablePolicy;
@end
