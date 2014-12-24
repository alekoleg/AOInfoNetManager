//
//  AOAppModel.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "AOAppModel.h"
#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "AOFile.h"

@implementation AOAppModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if ([key isEqual:@"icon"]) {
        return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AOFile class]];
    }
    return nil;
}
@end
