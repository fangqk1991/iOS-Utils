//
//  FCAlertView.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCAlertView.h"

@interface FCAlertView ()

@property (nonatomic) BOOL cancelAble;

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

+ (instancetype)alertInVC:(UIViewController *)viewController message:(NSString *)message
{
    FCAlertView *dialog = [self dialogWithTitle:message];
    dialog.cancelAble = NO;
    [dialog showInVC:viewController block:nil];
    return dialog;
}

+ (instancetype)confirmInVC:(UIViewController *)viewController message:(NSString *)message block:(void(^)(void))block
{
    FCAlertView *dialog = [self dialogWithTitle:message];
    dialog.cancelAble = YES;
    [dialog showInVC:viewController block:block];
    return dialog;
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
