//
//  AOAdsModel.h
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 14.01.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@class AOFile;
@interface AOAdsModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *schemeLink;
@property (nonatomic, strong) NSNumber *shouldShare;
@property (nonatomic, strong) NSString *excludeBundle;

@property (nonatomic, strong) AOFile *imageOne;
@property (nonatomic, strong) AOFile *imageSecond;
@property (nonatomic, strong) AOFile *imageThird;

@property (nonatomic, strong) AOFile *imageIpadOne;
@property (nonatomic, strong) AOFile *imageIpadSecond;
@property (nonatomic, strong) AOFile *imageIpadThird;

@property (nonatomic, readonly) NSArray *links;

@end
