//
//  UIImage+FCProcess.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

@interface UIImage(FCProcess)

- (UIImage *)fc_fitXY:(CGSize)newSize;
- (UIImage *)fc_fitCenter:(CGSize)newSize;
- (UIImage *)fc_centerInside:(CGSize)newSize;
- (UIImage *)fc_centerCrop:(CGSize)newSize;

- (UIImage *)fc_thumbnail:(CGSize)newSize;

@end
