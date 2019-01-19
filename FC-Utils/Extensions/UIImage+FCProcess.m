//
//  UIImage+FCProcess.m
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import "UIImage+FCProcess.h"

@implementation UIImage(FCProcess)

- (UIImage *)fc_fitXY:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 1);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)fc_fitCenter:(CGSize)newSize
{
    return [self fc_centerInside:newSize aspectFit:YES];
}

- (UIImage *)fc_centerInside:(CGSize)newSize
{
    return [self fc_centerInside:newSize aspectFit:NO];
}

- (UIImage *)fc_centerInside:(CGSize)newSize aspectFit:(BOOL)aspectFit
{
    CGFloat width = self.size.width * self.scale;
    CGFloat height = self.size.height * self.scale;
    
    CGSize perfectSize = CGSizeZero;
    
    CGFloat ratio = width / height;
    if(ratio > newSize.width / newSize.height)
    {
        if(width > newSize.width || aspectFit)
        {
            perfectSize.width = newSize.width;
            perfectSize.height = newSize.width / ratio;
        }
    }
    else
    {
        if(height > newSize.height || aspectFit)
        {
            perfectSize.width = newSize.height * ratio;
            perfectSize.height = newSize.height;
        }
    }
    
    if(CGSizeEqualToSize(perfectSize, CGSizeZero))
    {
        return self;
    }
    
    return [self fc_fitXY:perfectSize];
}

- (UIImage *)fc_centerCrop:(CGSize)newSize
{
    return [self fc_centerCrop:newSize clip:NO];
}

- (UIImage *)fc_centerCrop:(CGSize)newSize clip:(BOOL)clip
{
    CGFloat width = self.size.width * self.scale;
    CGFloat height = self.size.height * self.scale;
    
    CGSize perfectSize = CGSizeZero;
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    
    CGFloat ratio = width / height;
    CGFloat newRatio = newSize.width / newSize.height;
    if(ratio > newRatio)
    {
        // 矫正newSize，使缩略图尺寸不会大于原图
        if(newSize.height > height)
        {
            newSize.width = height * newRatio;
            newSize.height = height;
        }
        
        perfectSize.width = newSize.height * ratio;
        perfectSize.height = newSize.height;
        
        x = (perfectSize.width - newSize.width) / 2;
    }
    else
    {
        // 矫正newSize，使缩略图尺寸不会大于原图
        if(newSize.width > width)
        {
            newSize.width = width;
            newSize.height = width / newRatio;
        }
        
        perfectSize.width = newSize.width;
        perfectSize.height = newSize.width / ratio;
        
        y = (perfectSize.height - newSize.height) / 2;
    }
    
    UIImage *newImage = [self fc_fitXY:perfectSize];
    if(clip)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.width, newSize.height);
        CGImageRef imageRef = CGImageCreateWithImageInRect(newImage.CGImage, cropRect);
        
        UIImage * convertImg = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        
        return convertImg;
    }
    
    return newImage;
}

- (UIImage *)fc_thumbnail:(CGSize)newSize
{
    return [self fc_centerCrop:newSize clip:YES];
}

@end
