//
//  FCImageView.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

@interface FCImageView : UIImageView

- (void)setOnClick:(void (^)(FCImageView *))onClick;

@end
