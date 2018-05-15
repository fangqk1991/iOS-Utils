//
//  FCAlertView.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCAlertView.h"

@interface FCAlertView ()

@end

@implementation FCAlertView

- (instancetype)init
{
    if(self = [super init])
    {
        _cancelAble = YES;
    }
    
    return self;
}

+ (instancetype)dialogWithTitle:(NSString *)title
{
    return [FCAlertView alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
}

- (void)showInVC:(UIViewController *)viewController
{
    [self showInVC:viewController block:nil];
}

- (void)showInVC:(UIViewController *)viewController block:(void(^)(void))block
{
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if(block != nil)
            {
                block();
            }
        }];
        [self addAction:alertAction];
    }
    
    if(_cancelAble)
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [self addAction:alertAction];
    }
    
    [viewController presentViewController:self animated:YES completion:nil];
}

@end
