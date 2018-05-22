//
//  MasterViewController.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/13.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "MasterViewController.h"
#import "Master_FCVC.h"
#import "DialogListVC.h"
#import "ToastListVC.h"

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak __typeof(self)weakSelf = self;

    self.infos = @[
               @[
                   @{
                       @"text": @"FCVC",
                       @"event": ^{ [Master_FCVC fc_pushToNavigation:weakSelf.navigationController]; }
                       },
                   @{
                       @"text": @"FCDialog",
                       @"event": ^{ [DialogListVC fc_pushToNavigation:weakSelf.navigationController]; }
                       },
                   @{
                       @"text": @"FCToast",
                       @"event": ^{ [ToastListVC fc_pushToNavigation:weakSelf.navigationController]; }
                       },
                   ],
               ];
    
}

@end
