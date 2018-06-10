//
//  UIColor+Extensions.h
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import <UIKit/UIKit.h>

@interface UIColor(Extensions)

- (UIImage *)createImageWithSize:(CGSize)size;
+ (UIColor *)colorFromRGB:(NSUInteger)rgbValue;
+ (UIColor *)colorFromARGB:(NSUInteger)argbValue;

@end
