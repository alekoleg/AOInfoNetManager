//
//  AOAppModel.h
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import <MTLJSONAdapter.h>
#import <MTLModel.h>

@class AOFile;
@interface AOAppModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *redireсtURL;
@property (nonatomic, strong) AOFile *icon;

@end