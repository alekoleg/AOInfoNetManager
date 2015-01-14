//
//  ViewController.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "ViewController.h"
#import "AOInfoNetManager.h"
#import "AOAdsModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[AOInfoNetManager sharedManager] getAdsWithSuccess:^(NSArray *objects) {
        AOAdsModel *model = [objects firstObject];
        [[AOInfoNetManager sharedManager] loadImagesFromLinks:model.links success:^(NSArray *objects) {
            
        } fail:^(NSError *error) {
            
        }];
    } fail:^(NSError *error) {
        
    }];
}


@end
