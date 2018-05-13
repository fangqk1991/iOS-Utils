//
//  FCViewControllerBase.h
//  FC-Utils
//
//  Created by fang on 2018/5/13.
//

#import <UIKit/UIKit.h>

@interface FCViewControllerBase : UIViewController

- (void)fc_markParams:(id)object;
+ (instancetype)fc_createViewController;
+ (instancetype)fc_createViewController:(id)object;
+ (void)fc_pushToNavigation:(UINavigationController *)navigationController;
+ (void)fc_pushToNavigation:(UINavigationController *)navigationController params:(id)object;

@end
