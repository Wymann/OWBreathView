//
//  OWBreathView.m
//  HKCalculatorForIOS
//
//  Created by Owen Chen on 2018/5/30.
//  Copyright © 2018年 Owen. All rights reserved.
//

#import "OWBreathView.h"

#define default_tintColor [UIColor redColor]
#define default_breathSpeed 10
#define default_startAlpha 0.8

@interface OWBreathView()

@property (nonatomic) CGFloat insetWidth;
@property (nonatomic) CGFloat outSetWidth;

@property (nonatomic, strong) UIView *dotView;
@property (nonatomic, strong) UIView *borderView;

@end

@implementation OWBreathView
{
    BOOL setSpeed;
    BOOL setStartAlpha;
}

- (instancetype)initWithPoint:(CGPoint)point InsetWidth:(CGFloat)insetWidth outSetWidth:(CGFloat)outSetWidth
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(point.x, point.y, outSetWidth, outSetWidth);
        self.layer.cornerRadius = outSetWidth/2;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        _insetWidth = insetWidth;
        _outSetWidth = outSetWidth;
        
        setSpeed = NO;
        setStartAlpha = NO;
        
        [self setUI];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    
    _dotView.backgroundColor = _tintColor;
    _borderView.backgroundColor = _tintColor;
}

-(void)setBreathSpeed:(NSInteger)breathSpeed
{
    _breathSpeed = breathSpeed;
    _breathSpeed = _breathSpeed < 0 ? default_breathSpeed : _breathSpeed;
    _breathSpeed = _breathSpeed > 100 ? default_breathSpeed : _breathSpeed;
    
    setSpeed = YES;
}

-(void)setStartAlpha:(CGFloat)startAlpha
{
    _startAlpha = startAlpha;
    _startAlpha = _startAlpha < 0 ?  default_startAlpha : _startAlpha;
    _startAlpha = _startAlpha > 1.0 ?  default_startAlpha : _startAlpha;
    
    setStartAlpha = YES;
}

- (void)setUI
{
    CGFloat X = (_outSetWidth - _insetWidth)/2;
    CGFloat Y = X;
    _borderView = [[UIView alloc] initWithFrame:CGRectMake(X, Y, _insetWidth, _insetWidth)];
    _borderView.backgroundColor = default_tintColor;
    _borderView.layer.cornerRadius = _insetWidth/2;
    _borderView.clipsToBounds = YES;
    _borderView.alpha = 0.8;
    [self addSubview:_borderView];
    
    _dotView = [[UIView alloc] initWithFrame:CGRectMake(X, Y, _insetWidth, _insetWidth)];
    _dotView.backgroundColor = default_tintColor;
    _dotView.layer.cornerRadius = _insetWidth/2;
    _dotView.clipsToBounds = YES;
    [self addSubview:_dotView];
}

- (void)startAnimation
{
    CGFloat kAnimationDuration;
    if (setSpeed) {
        kAnimationDuration = 1 - _breathSpeed * 0.01;
    } else {
        kAnimationDuration = 1 - default_breathSpeed * 0.01;
    }
    CAGradientLayer *contentLayer = (CAGradientLayer *)_borderView.layer;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(_outSetWidth/_insetWidth, _outSetWidth/_insetWidth, 1)];
    scaleAnimation.duration = kAnimationDuration;
    scaleAnimation.cumulative = NO;
    scaleAnimation.repeatCount = NSIntegerMax;
    [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [contentLayer addAnimation: scaleAnimation forKey:@"myScale"];
    
    CGFloat startAlpha0;
    if (setStartAlpha) {
        startAlpha0 = _startAlpha;
    } else {
        startAlpha0 = default_startAlpha;
    }
    CABasicAnimation *showViewAnn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    showViewAnn.fromValue = [NSNumber numberWithFloat:startAlpha0];
    showViewAnn.toValue = [NSNumber numberWithFloat:0.0];
    showViewAnn.duration = kAnimationDuration;
    showViewAnn.fillMode = kCAFillModeForwards;
    showViewAnn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    showViewAnn.repeatCount = NSIntegerMax;
    showViewAnn.removedOnCompletion = NO;
    [contentLayer addAnimation:showViewAnn forKey:@"myShow"];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = kAnimationDuration;
    group.removedOnCompletion = NO;
    group.repeatCount = NSIntegerMax;
    group.fillMode = kCAFillModeForwards;
    [group setAnimations:@[scaleAnimation,showViewAnn]];
    
    [contentLayer addAnimation:group forKey:@"animationOpacity"];
}

- (void)stopAnimation
{
    [_borderView.layer removeAnimationForKey:@"myScale"];
    [_borderView.layer removeAnimationForKey:@"myShow"];
    [_borderView.layer removeAnimationForKey:@"animationOpacity"];
}

- (void)tap
{
    if (self.delegate) {
        [self.delegate didClickBreathView:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
