//
//  FCInputView.m
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import "FCInputView.h"

@interface FCInputView ()

@end

@implementation FCInputView

- (instancetype)init
{
    if(self = [super init])
    {
        _keyboardType = UIKeyboardTypeDefault;
        _fillText = @"";
    }
    
    return self;
}

+ (instancetype)dialogWithTitle:(NSString *)title
{
    return [FCInputView alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
}

- (void)showInView:(UIViewController *)viewController submit:(void(^)(NSString *text))block
{
    __weak __typeof(self)weakSelf = self;
    
    [self addTextFieldWithConfigurationHandler:^(UITextField * textField) {
        textField.keyboardType = weakSelf.keyboardType;
        textField.text = weakSelf.fillText;
    }];
    
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            UITextField *textField = weakSelf.textFields[0];
            
            NSString *text = textField.text;
            
            if(block != nil)
            {
                block(text);
            }
        }];
        [self addAction:alertAction];
    }
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [self addAction:alertAction];
    }
    
    [viewController presentViewController:self animated:YES completion:nil];
}

@end
