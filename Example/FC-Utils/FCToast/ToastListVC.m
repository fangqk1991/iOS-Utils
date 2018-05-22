//
//  ToastListVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/22.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "ToastListVC.h"
#import "FCToast.h"

@interface ToastListVC ()

@end

@implementation ToastListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    __weak typeof(self) weakSelf = self;
    
    self.infos = @[
                   @[
                       @{
                           @"text": @"Normal In Window",
                           @"event":
                               ^{
                                   [FCToast toast:@"In Window"];
                               }
                           },
                       @{
                           @"text": @"Normal In VC",
                           @"event":
                               ^{
                                   [FCToast toastInVC:weakSelf message:@"In VC"];
                               }
                           },
                       @{
                           @"text": @"Long Test",
                           @"event":
                               ^{
                                   [FCToast toastInVC:weakSelf message:@"长长长长长长长长长长长长长"];
                               }
                           },
                       ],
                   ];
}

+ (instancetype)fc_createViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ToastListVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"sb_ToastListVC"];
    return vc;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [navigationController pushViewController:[self fc_createViewController] animated:YES];
}

@end
