//
//  UIColor+Extensions.h
//  FC-Utils
//
//  Created by fang on 2018/6/10.
//

#import "FCView.h"


typedef NS_ENUM(NSInteger, FCBorderSide)
{
    kFCBorderSideTop = 1,
    kFCBorderSideRight = 2,
    kFCBorderSideBottom = 3,
    kFCBorderSideLeft = 4,
};

@interface UIView(Border)

- (void)fc_addBorder:(FCBorderSide)direction;
- (void)fc_addBorder:(FCBorderSide)direction color:(UIColor *)color;
- (void)fc_addBorder:(FCBorderSide)direction width:(CGFloat)borderWidth;
- (void)fc_addBorder:(FCBorderSide)direction color:(UIColor *)color width:(CGFloat)borderWidth;

@end
