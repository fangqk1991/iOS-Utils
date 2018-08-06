//
//  ExtensionsVC.m
//  FC-Utils_Example
//
//  Created by fang on 2018/5/22.
//  Copyright © 2018 fangqk1991. All rights reserved.
//

#import "ExtensionsVC.h"
#import "NSURL+Parse.h"

@interface ExtensionsVC ()

@end

@implementation ExtensionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    __weak typeof(self) weakSelf = self;
    
    self.infos = @[
                   @[
                       @{
                           @"text": @"NSURL+Parse",
                           @"event":
                               ^{
                                   {
                                       NSURL *url = [NSURL URLWithString:@"https://example.com/"];
                                       NSLog(@"%@: %@", url, [url queryParams]);
                                   }
                                   {
                                       NSURL *url = [NSURL URLWithString:@"https://example.com/?"];
                                       NSLog(@"%@: %@", url, [url queryParams]);
                                   }
                                   {
                                       NSURL *url = [NSURL URLWithString:@"https://example.com/?a=1&b"];
                                       NSLog(@"%@: %@", url, [url queryParams]);
                                   }
                                   {
                                       NSURL *url = [NSURL URLWithString:@"https://example.com/?a=1&b=2"];
                                       NSLog(@"%@: %@", url, [url queryParams]);
                                   }
                               }
                           },
                       ],
                   ];
}

+ (instancetype)fc_createViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ExtensionsVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"sb_ExtensionsVC"];
    return vc;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [navigationController pushViewController:[self fc_createViewController] animated:YES];
}

@end
