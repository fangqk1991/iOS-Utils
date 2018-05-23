//
//  FCToast.m
//  FC-Utils
//
//  Created by fang on 2018/5/22.
//

#import "FCToast.h"
#import "MBProgressHUD.h"

@implementation FCToast

+ (void)toast:(NSString *)message
{
    [FCToast toast:message delay:1.2f];
}

+ (void)toast:(NSString *)message delay:(float)delay
{
    [FCToast toastInView:[[[UIApplication sharedApplication] delegate] window] message:message delay:delay];
}

+ (void)toastInView:(UIView *)view message:(NSString *)message
{
    [FCToast toastInView:view message:message delay:1.2f];
}

+ (void)toastInView:(UIView *)view message:(NSString *)message delay:(float)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    if(message.length > 8)
    {
        hud.detailsLabel.text = message;
    }
    else
    {
        hud.label.text = message;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message
{
    [FCToast toastInView:vc.view message:message];
}

+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message delay:(float)delay
{
    [FCToast toastInView:vc.view message:message delay:delay];
}

@end
