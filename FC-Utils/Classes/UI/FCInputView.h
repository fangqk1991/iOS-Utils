//
//  FCInputView.h
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import <UIKit/UIKit.h>

@interface FCInputView : UIAlertController

@property (nonatomic) UIKeyboardType keyboardType;
@property (nonatomic) NSString *fillText;

+ (instancetype)dialogWithTitle:(NSString *)title;
- (void)showInVC:(UIViewController *)viewController submit:(void(^)(NSString *text))block;

@end
