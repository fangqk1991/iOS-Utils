//
//  FCViewControllerBase.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCViewControllerBase.h"

#define AssertFileExists(path) NSAssert([[NSFileManager defaultManager] fileExistsAtPath:path], @"Cannot find the file: %@", path)
#define AssertNibExists(file_name_string) AssertFileExists([[NSBundle mainBundle] pathForResource:file_name_string ofType:@"nib"])

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
    NSString *nibName = NSStringFromClass([self class]);
    if([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"] != nil)
    {
        FCViewControllerBase *viewController = [[[self class] alloc] initWithNibName:nibName bundle:nil];
        [viewController fc_markParams:object];
        return viewController;
    }
    
    NSLog(@"The nib %@ not exists", nibName);
    
    return nil;
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController
{
    [self fc_pushToNavigation:navigationController params:nil];
}

+ (void)fc_pushToNavigation:(UINavigationController *)navigationController params:(id)object
{
    UIViewController *vc = [self fc_createViewController:object];
    if(vc)
    {
        [navigationController pushViewController:vc animated:YES];
    }
}

@end
