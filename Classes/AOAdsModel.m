//
//  AOAdsModel.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 14.01.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

@import UIKit;
#import "AOAdsModel.h"
#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "AOFile.h"

@implementation AOAdsModel
@synthesize links = _links;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if ([key rangeOfString:@"image" options:NSCaseInsensitiveSearch].location != NSNotFound) {
        return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AOFile class]];
    }
    return nil;
}

- (NSArray *)links {
    if (!_links) {
        NSMutableArray *array = [NSMutableArray array];
        [self addUrlToArray:array fileIphonne:self.imageOne ipadFile:self.imageIpadOne];
        [self addUrlToArray:array fileIphonne:self.imageSecond ipadFile:self.imageIpadSecond];
        [self addUrlToArray:array fileIphonne:self.imageThird ipadFile:self.imageIpadThird];
        _links = [array copy];
    }
    return _links;
}

#pragma mark - Helper -

- (void)addUrlToArray:(NSMutableArray *)array fileIphonne:(AOFile *)iphoneFile ipadFile:(AOFile *)ipadFile {
    AOFile *file = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? iphoneFile : ipadFile;
    if (file.url) {
        [array addObject:file.url];
    }
}


@end
