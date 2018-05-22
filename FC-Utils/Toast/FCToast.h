//
//  FCToast.h
//  FC-Utils
//
//  Created by fang on 2018/5/22.
//

#import <Foundation/Foundation.h>

@interface FCToast : NSObject


+ (void)toast:(NSString *)message;
+ (void)toast:(NSString *)message delay:(float)delay;
+ (void)toastInView:(UIView *)view message:(NSString *)message;
+ (void)toastInView:(UIView *)view message:(NSString *)message delay:(float)delay;
+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message;
+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message delay:(float)delay;

@end
