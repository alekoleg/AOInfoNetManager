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

/**
 *   load apps info usualy for info section
 */
- (void)getOurAppsWithSuccess:(AOInfoNetArraySuccessBlock)success fail:(AOInfoNetFailBlock)fail;

/**
 *   load ads about other apps info
 */
- (void)getAdsWithSuccess:(AOInfoNetArraySuccessBlock)success fail:(AOInfoNetFailBlock)fail;

/**
 *   load array of images
 */
- (void)loadImagesFromLinks:(NSArray *)links success:(AOInfoNetArraySuccessBlock)success fail:(AOInfoNetFailBlock)fail;

@end
