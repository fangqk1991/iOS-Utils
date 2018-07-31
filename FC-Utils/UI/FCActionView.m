//
//  FCActionView.m
//  FC-Utils
//
//  Created by fang on 2018/5/22.
//

#import "FCActionView.h"

@implementation FCActionView

- (instancetype)init
{
    if(self = [super init])
    {
        self.cancelable = YES;
    }
    
    return self;
}

+ (instancetype)dialogWithTitle:(NSString *)title
{
    return [FCActionView alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
}

- (void)addAction:(NSString *)title handler:(void(^)(UIAlertAction *action))handler
{
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
    [self addAction:alertAction];
}

- (void)showInVC:(UIViewController *)viewController
{
    if(_cancelable)
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [self addAction:alertAction];
    }
    
    [viewController presentViewController:self animated:YES completion:nil];
}

@end
