//
//  FCActionView.h
//  FC-Utils
//
//  Created by fang on 2018/5/22.
//

#import <Foundation/Foundation.h>

@interface FCActionView : UIAlertController

@property (nonatomic) BOOL cancelable;

+ (instancetype)dialogWithTitle:(NSString *)title;
- (void)addAction:(NSString *)title handler:(void(^)(UIAlertAction *action))handler;
- (void)showInVC:(UIViewController *)viewController;

@end
