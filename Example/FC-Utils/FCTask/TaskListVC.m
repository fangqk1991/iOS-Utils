//
//  TaskListVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/23.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "TaskListVC.h"
#import "FCAsyncTask.h"
#import "NSLogger.h"

@interface TaskListVC ()

@end

@implementation TaskListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    
    self.infos = @[
                   @[
                       @{
                           @"text": @"Normal Task",
                           @"event":
                               ^{
                                   [weakSelf normalTask];
                               }
                           },
                       ],
                   ];
}

- (void)normalTask
{
    FCAsyncTask *task = [[FCAsyncTask alloc] init];
    task.doInBackgroundBlock = ^id(FCAsyncTask *_self) {
        LoggerApp(3, @"doInBackgroundBlock");
        return nil;
    };
    [task execute];
}

+ (instancetype)fc_createViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TaskListVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"sb_TaskListVC"];
    return vc;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [navigationController pushViewController:[self fc_createViewController] animated:YES];
}

@end

