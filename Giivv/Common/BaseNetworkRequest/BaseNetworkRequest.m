//
//  BaseNetworkRequest.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/10.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//
#define REQUEST_TIMEOUT_INTERVAL 10.0F
#import "BaseNetworkRequest.h"
#import <AFNetworking.h>

@interface BaseNetworkRequest()
/**
 *  request manager(AF_3.0 new method)
 */
@property(nonatomic, strong) AFHTTPSessionManager *defaultManager;
@end

@implementation BaseNetworkRequest
#pragma mark getters and setters
- (AFHTTPSessionManager *)defaultManager{
    if(!_defaultManager){
        _defaultManager = [[AFHTTPSessionManager alloc] init];
        [_defaultManager.requestSerializer setTimeoutInterval: REQUEST_TIMEOUT_INTERVAL];
    }
    return _defaultManager;
}

#pragma mark - init
- (id)init{
    self  = [super init];
    if (self) {
    }
    return self;
}
@end
