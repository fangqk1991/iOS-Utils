//
//  FCPhotoPicker.m
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import "FCPhotoPicker.h"
#import "UIImage+FCProcess.h"

@interface FCPhotoPicker()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) FCPhotoPickerBlock block;

@property (nonatomic) CGSize targetSize;

@end

@implementation FCPhotoPicker

- (instancetype)init
{
    if(self = [super init])
    {
        _targetSize = CGSizeMake(210, 210);
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title targetSize:(CGSize)targetSize handler:(FCPhotoPickerBlock)block
{
    if(self = [self init])
    {
        self.title = title;
        self.block = block;
        _targetSize = targetSize;
    }
    return self;
}

- (void)showInView:(UIViewController *)viewController
{
    UIAlertController * controller = [UIAlertController alertControllerWithTitle:_title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
            [self openImagePicker:UIImagePickerControllerSourceTypeCamera viewController:viewController];
        }];
        [controller addAction:alertAction];
    }
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self openImagePicker:UIImagePickerControllerSourceTypePhotoLibrary viewController:viewController];
        }];
        [controller addAction:alertAction];
    }
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [controller addAction:alertAction];
    }
    [viewController presentViewController:controller animated:YES completion:nil];
}

- (void)openImagePicker:(UIImagePickerControllerSourceType)type viewController:(UIViewController *)viewController
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = type;
        
        [viewController presentViewController:picker animated:YES completion:nil];
    }];
}

#pragma mark –
#pragma mark Camera View Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image != nil)
    {
        UIImage *avatarImage = [image fc_thumbnail:_targetSize];
        
        _block(avatarImage);
        _block = nil;
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    _block = nil;
}

@end
