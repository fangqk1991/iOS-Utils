//
//  UIColor+Extensions.m
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import "UIColor+Extensions.h"

@implementation UIColor(Extensions)

- (UIImage *)createImageWithSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIColor *)colorFromRGB:(NSUInteger)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}


+ (UIColor *)colorFromARGB:(NSUInteger)argbValue
{
    return [UIColor colorWithRed:((float)((argbValue & 0x00FF0000) >> 16))/255.0 \
                           green:((float)((argbValue & 0x0000FF00) >>  8))/255.0 \
                            blue:((float)((argbValue & 0x000000FF) >>  0))/255.0 \
                           alpha:((float)((argbValue & 0xFF000000) >>  24))/255.0];
}

@end
