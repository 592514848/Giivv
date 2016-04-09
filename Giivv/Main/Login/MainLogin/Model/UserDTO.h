//
//  UserDTO.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDTO : NSObject<NSCoding, NSCopying>
@property(nonatomic, strong) NSString *userID;
@property(nonatomic, strong) NSString *userName;
@property(nonatomic, strong) NSString *userPhone;
@property(nonatomic, strong) NSString *userMail;
@property(nonatomic, strong) NSString *userPhotoUrl;
@property(nonatomic, assign) BOOL isEnableTouchID;
@property(nonatomic, strong) NSString *localPasscode;
@end
