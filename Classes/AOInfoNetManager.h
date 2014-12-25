//
//  AOInfoNetManager.h
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const AOInfoNetErrorDomain;

typedef void(^AOInfoNetArraySuccessBlock)(NSArray *objects);
typedef void(^AOInfoNetFailBlock)(NSError *error);

@interface AOInfoNetManager : NSObject

+ (instancetype)sharedManager;

- (void)getOurAppsWithSuccess:(AOInfoNetArraySuccessBlock)success fail:(AOInfoNetFailBlock)fail;

@end
