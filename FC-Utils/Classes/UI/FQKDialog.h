//
//  FQKDialog.h
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FQKDialog : NSObject

+ (UIAlertController *)showSingleNumberInputDialogInView:(UIViewController *)viewController title:(NSString *)title submit:(void(^)(NSString *text))block;
+ (UIAlertController *)showSingleTextInputDialogInView:(UIViewController *)viewController title:(NSString *)title submit:(void(^)(NSString *text))block;

@end
