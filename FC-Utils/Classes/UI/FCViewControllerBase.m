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
    NSString *nibName = NSStringFromClass([self class]);
    
    if([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"] != nil)
    {
        return [[[self class] alloc] initWithNibName:nibName bundle:nil];
    }
    
    @try {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FCViewControllerBase *vc = [storyboard instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"sb_%@", nibName]];
        return vc;
    }
    @catch (NSException *exception) {
        NSLog(@"Neither %@ nib nor sb_%@ in Main.storyboard exists", nibName, nibName);
    }
          
    return nil;
}

+ (instancetype)fc_createViewController:(id)object
{
    FCViewControllerBase *vc = [self fc_createViewController];
    if(vc)
    {
        [vc fc_markParams:object];
    }
    return vc;
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
