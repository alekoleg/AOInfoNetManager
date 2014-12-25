//
//  ViewController.m
//  MDMNetManager
//
//  Created by Alekseenko Oleg on 24.12.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "ViewController.h"
#import "AOInfoNetManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[AOInfoNetManager sharedManager] getOurAppsWithSuccess:^(NSArray *objects) {
        
    } fail:^(NSError *error) {
        
    }];
}


@end
