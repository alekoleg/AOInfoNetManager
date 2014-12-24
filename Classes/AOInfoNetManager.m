//
//  AOInfoNetManager.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "AOInfoNetManager.h"
#import <AFNetworking.h>

static NSString * const AOInfoNetParseApiURL = @"https://api.parse.com/1/";

@interface AOInfoNetManager ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation AOInfoNetManager

+ (instancetype)sharedManager {
    static AOInfoNetManager *_singletonInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singletonInfo = [[AOInfoNetManager alloc] init];
    });
    return _singletonInfo;
}

- (instancetype)init {
    if (self = [super init]) {
        NSURL *url = [NSURL URLWithString:AOInfoNetParseApiURL];
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
        [_manager.requestSerializer setValue:@"vkXzxw03xqRvYPEec1BBOgFqOob9X8Y1D6i2iE23" forHTTPHeaderField:@"X-Parse-Application-Id"];
        [_manager.requestSerializer setValue:@"odMRwikFRTR14tZ3gEf14JWQvtibyoRNKaD5igQY" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    }
    return self;
}

@end
