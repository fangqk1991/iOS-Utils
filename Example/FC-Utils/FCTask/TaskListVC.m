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
#import "MBProgressHUD.h"
#import "MyAsyncTask.h"

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
                           @"text": @"AsyncTask",
                           @"event":
                               ^{
                                   [weakSelf normalTask];
                               }
                           },
                       @{
                           @"text": @"FCTypicalTask",
                           @"event":
                               ^{
                                   [weakSelf typicalTask];
                               }
                           },
                       @{
                           @"text": @"Task - Exception",
                           @"event":
                               ^{
                                   [weakSelf testException];
                               }
                           },
                       ],
                   ];
}

- (void)normalTask
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.detailsLabel.text = @"Loading";
    
    FCAsyncTask *task = [[FCAsyncTask alloc] init];
    task.onPreExecuteBlock = ^{
        hud.progress = 0;
    };
    task.onProgressUpdateBlock = ^(NSUInteger current, NSUInteger total) {
        hud.progress = 1.0 * current / total;
        hud.detailsLabel.text = [NSString stringWithFormat:@"%@ / %@", @(current), @(total)];
        LoggerApp(3, @"Progress: %@ / %@", @(current), @(total));
    };
    task.doInBackgroundBlock = ^id(FCAsyncTask *_self) {
        LoggerApp(3, @"doInBackgroundBlock");
        for(int i = 0; i < 10; ++i)
        {
            [_self updateProgress:i total:10];
            sleep(1);
        }
        return nil;
    };
    task.onPostExecuteBlock = ^(id result) {
        [hud hideAnimated:YES];
    };
    [task execute];
}

- (void)typicalTask
{
    MyAsyncTask *task = [[MyAsyncTask alloc] initWithView:self.view];
    task.hint = @"请等待";
    [task execute];
}

- (void)testException
{
    MyAsyncTask *task = [[MyAsyncTask alloc] initWithView:self.view];
    task.testException = YES;
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

