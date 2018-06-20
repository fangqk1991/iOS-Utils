//
//  FCPhotoPicker.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

typedef void (^FCPhotoPickerBlock)(UIImage *image);

@interface FCPhotoPicker : NSObject

- (instancetype)initWithTitle:(NSString *)title targetSize:(CGSize)targetSize handler:(FCPhotoPickerBlock)block;
- (void)showInView:(UIViewController *)viewController;

@end
