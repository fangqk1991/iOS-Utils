//
//  FCViewControllerBase.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCViewControllerBase.h"

@interface FCViewControllerBase ()

@end

@implementation FCViewControllerBase

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fc_markParams:(id)object
{
}

+ (instancetype)fc_createViewController
{
    return [self fc_createViewController:nil];
}

+ (instancetype)fc_createViewController:(id)object
{
    FCViewControllerBase *viewController = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    [viewController fc_markParams:object];
    return viewController;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [self fc_pushToNavigation:navigationController params:nil];
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController params:(id)object
{
    [navigationController pushViewController:[self fc_createViewController:object] animated:YES];
}

@end
