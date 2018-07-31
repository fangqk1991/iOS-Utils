//
//  FCImageView.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

@interface FCView : UIImageView

- (void)setOnClick:(void (^)(FCView *))onClick;

@end
