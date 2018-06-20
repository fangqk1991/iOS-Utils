//
//  FCPhotoPicker.h
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import <UIKit/UIKit.h>

typedef void (^FCPhotoPickerBlock)(UIImage *image);

@interface FCPhotoPicker : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic) CGSize targetSize;
@property (nonatomic, copy) FCPhotoPickerBlock handler;

- (void)showInView:(UIViewController *)viewController;

@end
