//
//  FCTextFieldGroup.m
//  FC-Utils
//
//  Created by fang on 2018/6/9.
//

#import "FCTextFieldGroup.h"

@interface FCTextFieldGroup()<UITextFieldDelegate>

@property (nonatomic, strong) NSArray *textFields;
@property (nonatomic, copy) void(^onLastReturn)(void);

@end

@implementation FCTextFieldGroup

- (instancetype)initWithTextFields:(NSArray *)textFields onLastReturn:(void(^)(void))onLastReturn
{
    self = [self init];
    if(self)
    {
        self.textFields = textFields;
        self.onLastReturn = onLastReturn;
        
        for (UITextField *textField in textFields) {
            textField.delegate = self;
        }
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSUInteger index = [_textFields indexOfObject:textField];
    if(index != NSNotFound)
    {
        if(index == _textFields.count - 1)
        {
            [textField resignFirstResponder];
            
            if(self.onLastReturn != nil)
            {
                self.onLastReturn();
            }
        }
        else
        {
            UITextField *nextField = _textFields[index + 1];
            [nextField becomeFirstResponder];
        }
        return NO;
    }
    
    return YES;
}

@end
