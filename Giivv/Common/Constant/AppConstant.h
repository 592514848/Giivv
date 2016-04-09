//
//  AppConstant.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/4.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h

/**
 *  device width and height
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/**
 *  tabbar height
 */
#define TABBAR_HEIGHT 49.0f

/**
 *  navitaionbar height
 */
#define NAVIGATIONBAR_HEIGHT 64.0f

/**
 *  statusbar height
 */
#define STATUSBAR_HEIGHT 20.0f

/**
 *  statusbar height
 */
#define CONTENT_HEIGHT (SCREEN_HEIGHT - TABBAR_HEIGHT - NAVIGATIONBAR_HEIGHT)

/**
 *  window object
 */
#define WINDOW [[UIApplication sharedApplication] keyWindow]

/**
 *  __weak self define
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/**
 *  object is not nil and null
 */
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

/**
 *  object is nil or null
 */
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

/**
 *  string is nil or null or empty
 */
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

/**
 *  Array is nil or null or empty
 */
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

/**
 *  validate string
 */
#define VALIDATE_STRING(str) IsNilOrNull(str) ? @"" : str

#endif /* AppConstant_h */
