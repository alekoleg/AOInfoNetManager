//
//  AOInfoNetManager.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "AOInfoNetManager.h"
#import <AFNetworking.h>
#import <MTLJSONAdapter.h>
#import "AOAppModel.h"

static NSString * const AOInfoNetParseApiURL = @"https://api.parse.com/1/";
NSString * const AOInfoNetErrorDomain = @"AOInfoNetErrorDomain";


@interface AOInfoNetManager ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
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
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [_manager.requestSerializer setValue:@"vkXzxw03xqRvYPEec1BBOgFqOob9X8Y1D6i2iE23" forHTTPHeaderField:@"X-Parse-Application-Id"];
        [_manager.requestSerializer setValue:@"WD2m1TpPOo7mYOV2rEJ7RjD6MsIzLTgTidacS7le" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    }
    return self;
}

#pragma mark - Actions -

- (void)getOurAppsWithSuccess:(AOInfoNetArraySuccessBlock)success fail:(AOInfoNetFailBlock)fail {
    
    NSString *path = @"classes/Appinfo";
    NSDictionary *dic = @{ @"enable" : @{ @"$ne" : @NO }};
    NSString *whereString = [self whereQueryStringFromJSONDic:dic];
    NSDictionary *params = @{ @"where" : whereString,
                          @"order" : @"order" };
    [self getWithPath:path params:params class:[AOAppModel class] keyMap:@"results" complete:^(id object) {
        NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (%K CONTAINS[c] %@)", @"excludeBundle", bundleId];
        NSArray *results = [object filteredArrayUsingPredicate:predicate];
        if (success) {
            success(results);
        }
    } fail:fail];
}

#pragma mark - Helpers -
/**
 * Общий метод получения данныхр
 * @param params - параметры передаваемые на сервер, может быть NSDictionaty или NSArray
 * @param class - класс в поторых нужно смапить ответ
 * @param keyMap - ключ по которому нужно достать ответ от сервера, так как в ответе может быть еще служебная инфа
 */

- (void)getWithPath:(NSString *)pathIn params:(NSDictionary *)params class:(Class)classToMap keyMap:(NSString *)keyMap complete:(void (^)(id object))complete fail:(void (^)(NSError *error))failed {
    
    [_manager GET:pathIn parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (![responseObject valueForKey:@"error"]) {
            
            id value = responseObject;
            if (![responseObject isKindOfClass:[NSArray class]] && [responseObject valueForKey:keyMap]) {
                value = [responseObject valueForKey:keyMap];
            }
            
            if (classToMap) {
                value = [self mapForClass:classToMap fromObject:value];
            }
            
            if (complete) {
                complete(value);
            }
        } else {
            //error
            NSError *error = [NSError errorWithDomain:AOInfoNetErrorDomain code:0 userInfo:@{ NSLocalizedDescriptionKey : [responseObject valueForKey:@"error"]}];
            if (failed) {
                failed(error);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failed) {
            failed(error);
        }
    }];
}

/**
 * Метод для мапинга данных от сервера в модель
 * @param object - еслин на входе NSDictionary возвращается модель, если NSArray возвращается Array моделей
 */
- (id)mapForClass:(Class)class fromObject:(id)object {
    id  result = nil;
    
    id (^mapBlock) (NSDictionary *dic) = ^id (NSDictionary *dic){
        NSError *error = nil;
        id object = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:dic error:&error];
        if (error) {
            NSLog(@"%@", [error description]);
        }
        
        return object;
    };
    
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in object) {
            [array addObject:mapBlock(dic)];
        }
        result = array;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        result = mapBlock(object);
    }
    return result;
}

- (NSString *)whereQueryStringFromJSONDic:(NSDictionary *)dic {
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:NULL];
    NSString *JSON = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    return JSON;
}

@end
