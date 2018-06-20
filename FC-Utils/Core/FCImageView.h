//
//  FCImageView.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

@interface FCImageView : UIImageView

@property (nonatomic, copy) void (^onClick)(FCImageView *sender);

@end
