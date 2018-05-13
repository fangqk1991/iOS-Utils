//
//  FCDialog.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCDialog.h"

@implementation FCDialog

+ (UIAlertController *)showSingleTextInputDialogInView:(UIViewController *)viewController title:(NSString *)title submit:(void(^)(NSString *text))block
{
    return [self showInView:viewController title:title fillText:@"" keyboardType:UIKeyboardTypeDefault submit:block];
}

+ (UIAlertController *)showSingleNumberInputDialogInView:(UIViewController *)viewController title:(NSString *)title submit:(void(^)(NSString *text))block
{
    return [self showInView:viewController title:title fillText:@"" keyboardType:UIKeyboardTypeDecimalPad submit:block];
}

+ (UIAlertController *)showInView:(UIViewController *)viewController title:(NSString *)title fillText:(NSString *)fillText keyboardType:(UIKeyboardType)keyboardType submit:(void(^)(NSString *text))block
{
    UIAlertController * controller = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * textField) {
        textField.keyboardType = keyboardType;
        textField.text = fillText;
    }];
    
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            UITextField *textField = controller.textFields[0];
            
            NSString *text = textField.text;
            
            if(block != nil)
            {
                block(text);
            }
        }];
        [controller addAction:alertAction];
    }
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [controller addAction:alertAction];
    }
    [viewController presentViewController:controller animated:YES completion:nil];
    
    return controller;
}

@end
