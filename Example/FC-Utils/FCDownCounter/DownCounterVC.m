//
//  DownCounterVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/6/9.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "DownCounterVC.h"
#import "FCToast.h"
#import "FCDownCounter.h"

@interface DownCounterVC ()

@property (nonatomic, strong) FCDownCounter *counter;

@end

@implementation DownCounterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _counter = [[FCDownCounter alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    self.infos = @[
                   @[
                       @{
                           @"text": @"10s - 1s",
                           @"event":
                               ^{
                                   [weakSelf.counter setTotalSeconds:10 step:1];
                                   [weakSelf.counter startWithStepCallback:^(CGFloat remain) {
                                       [FCToast toastInVC:weakSelf message:[NSString stringWithFormat:@"%.2f", remain]];
                                   } doneCallback:^{
                                       [FCToast toastInVC:weakSelf message:@"完成"];
                                   }];
                               }
                           },
                       @{
                           @"text": @"10s - 0.1s",
                           @"event":
                               ^{
                                   [weakSelf.counter setTotalSeconds:10 step:0.1];
                                   [weakSelf.counter startWithStepCallback:^(CGFloat remain) {
                                       NSLog(@"%.2f", remain);
                                       [FCToast toastInVC:weakSelf message:[NSString stringWithFormat:@"%.2f", remain]];
                                   } doneCallback:^{
                                       [FCToast toastInVC:weakSelf message:@"完成"];
                                   }];
                               }
                           },
                       ],
                   ];
}

+ (instancetype)fc_createViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DownCounterVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"sb_DownCountVC"];
    return vc;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [navigationController pushViewController:[self fc_createViewController] animated:YES];
}

- (void)dealloc
{
    [_counter reset];
}

@end
