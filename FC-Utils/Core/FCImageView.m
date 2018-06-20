//
//  FCImageView.m
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import "FCImageView.h"

IB_DESIGNABLE
@interface FCImageView()

@property (nonatomic) IBInspectable BOOL isCircle;
@property (nonatomic) IBInspectable UIColor *circleBorderColor;
@property (nonatomic) IBInspectable NSUInteger circleBorderWidth;



@property (nonatomic) IBInspectable NSUInteger cornerRadius;

@end


@implementation FCImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadDefault];
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefault];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
}

- (void)loadDefault
{
    _isCircle = NO;
    _circleBorderColor = [UIColor clearColor];
    _circleBorderWidth = 0;
    
    _cornerRadius = 0;
}

- (void)commonInit
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.isCircle)
        {
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2;
            
            if(self.circleBorderWidth > 0)
            {
                CAShapeLayer *layer = [CAShapeLayer layer];
                layer.lineWidth = self.circleBorderWidth * 2; // border 有一半的宽度被 mask 了，故通过 *2 补齐
                layer.fillColor = NULL;
                layer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
                layer.strokeColor = self.circleBorderColor.CGColor;
                layer.contentsScale = [UIScreen mainScreen].scale;
                layer.shouldRasterize = NO;
                
                [self.layer addSublayer:layer];
            }
        }
        else if(self.cornerRadius > 0)
        {
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = self.cornerRadius;
        }
    });
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)]];
}

- (void)onTap:(UITapGestureRecognizer *)recognizer
{
    if(_onClick)
    {
        _onClick(self);
    }
}

@end
