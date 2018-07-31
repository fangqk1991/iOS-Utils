//
//  FCImageView.m
//  FC-Utils
//
//  Created by fang on 2018/6/20.
//

#import "FCView.h"
#import "UIView+Border.h"

IB_DESIGNABLE
@interface FCView()

@property (nonatomic) IBInspectable BOOL hasTopBorder;
@property (nonatomic) IBInspectable BOOL hasBottomBorder;
@property (nonatomic) IBInspectable BOOL hasLeftBorder;
@property (nonatomic) IBInspectable BOOL hasRightBorder;

@property (nonatomic) IBInspectable UIColor *borderColor;

@property (nonatomic, copy) void (^onClick)(FCView *sender);

@end


@implementation FCView

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
    _hasTopBorder = NO;
    _hasBottomBorder = NO;
    _hasLeftBorder = NO;
    _hasRightBorder = NO;
    _borderColor = [UIColor colorWithRed:0xb2/255.0f green:0xb3/255.0f blue:0xb2/255.0f alpha:1];
}

- (void)commonInit
{
    dispatch_async(dispatch_get_main_queue(), ^{

        if(self.hasTopBorder)
        {
            [self fc_addBorder:kFCBorderSideTop color:self.borderColor];
        }
        if(self.hasBottomBorder)
        {
            [self fc_addBorder:kFCBorderSideBottom color:self.borderColor];
        }
        if(self.hasLeftBorder)
        {
            [self fc_addBorder:kFCBorderSideLeft color:self.borderColor];
        }
        if(self.hasRightBorder)
        {
            [self fc_addBorder:kFCBorderSideRight color:self.borderColor];
        }
    });
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)]];
}

- (void)setOnClick:(void (^)(FCView *sender))onClick
{
    self.userInteractionEnabled = YES;
    _onClick = [onClick copy];
}

- (void)onTap:(UITapGestureRecognizer *)recognizer
{
    if(_onClick)
    {
        _onClick(self);
    }
}

@end
