//
//  UIColor+Extensions.m
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import "UIView+Border.h"

@implementation UIView(Border)

- (UIColor *)fc_defaultBorderColor
{
    return [UIColor colorWithRed:0xb2/255.0f green:0xb3/255.0f blue:0xb2/255.0f alpha:1];
}

- (CGFloat)fc_defaultBorderWidth
{
    return 1 / [UIScreen mainScreen].scale;
}

- (void)fc_addBorder:(FCBorderSide)direction
{
    [self fc_addBorder:direction color:[self fc_defaultBorderColor] width:[self fc_defaultBorderWidth]];
}

- (void)fc_addBorder:(FCBorderSide)direction color:(UIColor *)color
{
    [self fc_addBorder:direction color:color width:[self fc_defaultBorderWidth]];
}

- (void)fc_addBorder:(FCBorderSide)direction width:(CGFloat)borderWidth
{
    [self fc_addBorder:direction color:[self fc_defaultBorderColor] width:borderWidth];
}

- (void)fc_addBorder:(FCBorderSide)direction color:(UIColor *)color width:(CGFloat)borderWidth
{
    CGRect frame = CGRectZero;

    switch (direction)
    {
        case kFCBorderSideTop:
            frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
            break;
        case kFCBorderSideRight:
            frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
            break;
        case kFCBorderSideBottom:
            frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
            break;
        case kFCBorderSideLeft:
            frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
            break;
    }

    [self fc_addBorderWithColor:color frame:frame];
}

- (void)fc_addBorderWithColor:(UIColor *)color frame:(CGRect)frame
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = frame;
    [self.layer addSublayer:border];
}

@end
