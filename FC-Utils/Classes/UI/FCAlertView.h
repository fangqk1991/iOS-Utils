//
//  FCAlertView.h
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import <UIKit/UIKit.h>

@interface FCAlertView : UIAlertController

@property (nonatomic) BOOL cancelAble;

+ (instancetype)dialogWithTitle:(NSString *)title;
- (void)showInVC:(UIViewController *)viewController;
- (void)showInVC:(UIViewController *)viewController block:(void(^)(void))block;

@end
