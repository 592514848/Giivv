//
//  UserDTO.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/9.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "UserDTO.h"

@implementation UserDTO

#pragma mark - nscoding delegate
#pragma mark encode
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject: VALIDATE_STRING(_userID) forKey: @"userID"];
    [aCoder encodeObject: VALIDATE_STRING(_userName) forKey: @"userName"];
    [aCoder encodeObject: VALIDATE_STRING(_userPhone) forKey: @"userPhone"];
    [aCoder encodeObject: VALIDATE_STRING(_userMail) forKey: @"userMail"];
    [aCoder encodeObject: VALIDATE_STRING(_userPhotoUrl) forKey: @"userPhotoUrl"];
    [aCoder encodeObject: [NSNumber numberWithBool: _isEnableTouchID] forKey: @"isEnableTouchID"];
    [aCoder encodeObject: VALIDATE_STRING(_localPasscode) forKey: @"localPasscode"];
}

#pragma mark decode
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _userID = VALIDATE_STRING([aDecoder decodeObjectForKey: @"userID"]);
        _userName = VALIDATE_STRING([aDecoder decodeObjectForKey: @"userName"]);
        _userPhone = VALIDATE_STRING([aDecoder decodeObjectForKey: @"userPhone"]);
        _userMail = VALIDATE_STRING([aDecoder decodeObjectForKey: @"userMail"]);
        _userPhotoUrl = VALIDATE_STRING([aDecoder decodeObjectForKey: @"userPhotoUrl"]);
        _isEnableTouchID = [[aDecoder decodeObjectForKey: @"isEnableTouchID"] boolValue];
        _localPasscode = VALIDATE_STRING([aDecoder decodeObjectForKey: @"localPasscode"]);
    }
    return self;
}

#pragma mark - NScopying delegate
- (id)copyWithZone:(NSZone *)zone{
    UserDTO *user = [[UserDTO allocWithZone: zone] init];
    _userID = [user.userID copyWithZone: zone];
    _userName = [user.userName copyWithZone: zone];
    _userPhone = [user.userPhone copyWithZone: zone];
    _userMail = [user.userMail copyWithZone: zone];
    _userPhotoUrl = [user.userPhotoUrl copyWithZone: zone];
    _isEnableTouchID = [user isEnableTouchID];
    _localPasscode = [user.localPasscode copyWithZone: zone];
    return user;
}
@end
