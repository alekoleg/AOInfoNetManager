//
//  AOFile.h
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface AOFile : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;

@end
