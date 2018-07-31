//
//  FCAlertView.h
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import <UIKit/UIKit.h>

@interface FCAlertView : UIAlertController

+ (instancetype)alertInVC:(UIViewController *)viewController message:(NSString *)message;
+ (instancetype)confirmInVC:(UIViewController *)viewController message:(NSString *)message block:(void(^)(void))block;

@end
