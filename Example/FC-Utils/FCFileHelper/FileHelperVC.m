//
//  FileHelperVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/6/10.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "FileHelperVC.h"
#import "FCFileHelper.h"
#import "FCToast.h"

@interface FileHelperVC ()

@end

@implementation FileHelperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    __weak typeof(self) weakSelf = self;
    
    self.infos = @[
                   @[
                       @{
                           @"text": @"NSDocumentDirectory",
                           @"event":
                               ^{
                                   [FCToast toastInVC:weakSelf message:[FCFileHelper documentsDir] delay:2.0f];
                               }
                           },
                       @{
                           @"text": @"NSCachesDirectory",
                           @"event":
                               ^{
                                   [FCToast toastInVC:weakSelf message:[FCFileHelper cachesDir] delay:2.0f];
                               }
                           },
                       @{
                           @"text": @"NSTemporaryDirectory",
                           @"event":
                               ^{
                                   [FCToast toastInVC:weakSelf message:[FCFileHelper tempDir] delay:2.0f];
                               }
                           },
                       ],
                   ];
}

+ (instancetype)fc_createViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:@"sb_FileHelperVC"];
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [navigationController pushViewController:[self fc_createViewController] animated:YES];
}

@end
