# 简介
这是一个常用功能工具包，Objective-C 版。

<!--
[![CI Status](https://img.shields.io/travis/fangqk1991/FC-Utils.svg?style=flat)](https://travis-ci.org/fangqk1991/FC-Utils)
[![Version](https://img.shields.io/cocoapods/v/FC-Utils.svg?style=flat)](https://cocoapods.org/pods/FC-Utils)
[![License](https://img.shields.io/cocoapods/l/FC-Utils.svg?style=flat)](https://cocoapods.org/pods/FC-Utils)
[![Platform](https://img.shields.io/cocoapods/p/FC-Utils.svg?style=flat)](https://cocoapods.org/pods/FC-Utils)
-->

## 依赖
* iOS 8+


## 安装
FC-Utils 使用 [CocoaPods](https://cocoapods.org) 进行安装.

编辑 `podfile`

```ruby
target 'MyApp' do
    ...

    pod 'FC-Utils', :git => 'https://github.com/fangqk1991/iOS-Utils.git'
    
    # Use Toast
    pod 'FC-Utils/Toast', :git => 'https://github.com/fangqk1991/iOS-Utils.git'
end
```

运行

```
pod install
```

## 使用
请到 `Example` 工程目录下，执行 `pod install` 后运行示例工程

### UI
```
// 可点击、设置边框的 UIView
@interface FCView : UIView
- (void)setOnClick:(void (^)(FCView *sender))onClick;
@end

IB_DESIGNABLE
@interface FCView()
@property (nonatomic) IBInspectable BOOL hasTopBorder;
@property (nonatomic) IBInspectable BOOL hasBottomBorder;
@property (nonatomic) IBInspectable BOOL hasLeftBorder;
@property (nonatomic) IBInspectable BOOL hasRightBorder;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic, copy) void (^onClick)(FCView *sender);
@end
```

```
// 可点击、设置圆角的 UIImageView
@interface FCImageView : UIImageView
- (void)setOnClick:(void (^)(FCImageView *sender))onClick;
@end

IB_DESIGNABLE
@interface FCImageView()
@property (nonatomic) IBInspectable BOOL isCircle;
@property (nonatomic) IBInspectable UIColor *circleBorderColor;
@property (nonatomic) IBInspectable NSUInteger circleBorderWidth;
@property (nonatomic, copy) void (^onClick)(FCImageView *sender);
@property (nonatomic) IBInspectable NSUInteger cornerRadius;
@end
```

```
// 快捷调用的 AlertView
@interface FCAlertView : UIAlertController
+ (instancetype)alertInVC:(UIViewController *)viewController message:(NSString *)message;
+ (instancetype)confirmInVC:(UIViewController *)viewController message:(NSString *)message block:(void(^)(void))block;
@end
```

```
// 快捷调用的 ActionSheet
@interface FCActionView : UIAlertController

@property (nonatomic) BOOL cancelable;
+ (instancetype)dialogWithTitle:(NSString *)title;
- (void)addAction:(NSString *)title handler:(void(^)(UIAlertAction *action))handler;
- (void)showInVC:(UIViewController *)viewController;
@end
```

```
// 快捷输入框
@interface FCInputView : UIAlertController

@property (nonatomic) UIKeyboardType keyboardType;
@property (nonatomic) NSString *fillText;

+ (instancetype)dialogWithTitle:(NSString *)title;
- (void)showInVC:(UIViewController *)viewController submit:(void(^)(NSString *text))block;
@end
```

### Task

```
// 异步任务
@interface FCAsyncTask : NSOperation

@property (nonatomic, copy) FCTaskOnPreExecute onPreExecuteBlock;
@property (nonatomic, copy) FCTaskOnProgressUpdate onProgressUpdateBlock;
@property (nonatomic, copy) FCTaskOnPostExecute onPostExecuteBlock;
@property (nonatomic, copy) FCTaskOnFailure onFailureBlock;
@property (nonatomic, copy) FCTaskOnBackground doInBackgroundBlock;

- (void)updateProgress:(NSUInteger)current total:(NSUInteger)total;
- (void)execute;
@end
```

```
// 异步任务，借鉴 Android 的 AsyncTask
@interface FCAsyncTask2 : NSOperation
- (void)onPreExecute;
- (id)doInBackground;
- (void)onPostExecute:(id)result;
- (void)onFailure:(FCTaskException *)exception;
- (void)execute;
@end
```

### Toast
```
// 信息提示相关
@interface FCToast : NSObject
+ (void)toast:(NSString *)message;
+ (void)toast:(NSString *)message delay:(float)delay;
+ (void)toastInView:(UIView *)view message:(NSString *)message;
+ (void)toastInView:(UIView *)view message:(NSString *)message delay:(float)delay;
+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message;
+ (void)toastInVC:(UIViewController *)vc message:(NSString *)message delay:(float)delay;
@end
```

### FCUtils
```
// 系统信息相关
@interface FCUtils : NSObject
+ (NSString *)getAppVersion;
+ (NSString *)getSystemVersion;
@end
```

### FCFileHelper
```
// 文件管理相关
@interface FCFileHelper : NSObject
+ (NSString *)documentsDir;
+ (NSString *)cachesDir;
+ (NSString *)tempDir;
+ (BOOL)createDir:(NSString *)path;
+ (void)removeFile:(NSString *)filePath;
@end
```

### FCDownCounter
```
// 倒计时控件
@interface FCDownCounter : NSObject
- (void)setTotalSeconds:(NSUInteger)totalSeconds;
- (void)setTotalSeconds:(NSUInteger)totalSeconds step:(CGFloat)step;
- (void)reset;
- (void)startWithStepCallback:(void(^)(CGFloat remain))stepCallback doneCallback:(void(^)(void))doneCallback;
@end
```

### Extensions
```
// UIView 边框设置
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
```
```
// UIImage 处理
@interface UIImage(FCProcess)
- (UIImage *)fc_fitXY:(CGSize)newSize;
- (UIImage *)fc_fitCenter:(CGSize)newSize;
- (UIImage *)fc_centerInside:(CGSize)newSize;
- (UIImage *)fc_centerCrop:(CGSize)newSize;
- (UIImage *)fc_thumbnail:(CGSize)newSize;
@end
```
```
// UIColor 初始化、输出
@interface UIColor(Extensions)
- (UIImage *)createImageWithSize:(CGSize)size;
+ (UIColor *)colorFromRGB:(NSUInteger)rgbValue;
+ (UIColor *)colorFromARGB:(NSUInteger)argbValue;
@end
```
```
@interface NSString(Encode)
- (NSString *)createMD5;
- (NSString *)createBase64;
@end
```
```
@interface NSData(Encode)
- (NSString *)createMD5;
@end
```
```
@interface NSURL(Parse)
- (NSDictionary *)queryParams;
@end
```
```
@interface NSDate(String)
+ (NSDate *)dateWithStr:(NSString *)str;
- (NSString *)dateStr;
- (int)compareWithDate:(NSDate *)date;
@end
```

## Author

fangqk1991, me@fangqk.com

## License

FC-Utils is available under the MIT license. See the LICENSE file for more info.
