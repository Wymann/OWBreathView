//
//  OWBreathView.h
//  HKCalculatorForIOS
//
//  Created by Owen Chen on 2018/5/30.
//  Copyright © 2018年 Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OWBreathView;

@protocol OWBreathViewDelegate <NSObject>

@optional
- (void)didClickBreathView:(OWBreathView *)breathView;

@end

@interface OWBreathView : UIView

/**
 呼吸灯颜色
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 0 - 100
 */
@property (nonatomic) NSInteger breathSpeed;

/**
 呼吸灯颜色强度
 */
@property (nonatomic) CGFloat startAlpha;

@property (nonatomic, weak) id <OWBreathViewDelegate> delegate;

/**
 初始一个breathView

 @param point breathView的位置
 @param insetWidth breathView中心圆点的直径
 @param outSetWidth breathView呼吸最大的直径
 @return breathView
 */
- (instancetype)initWithPoint:(CGPoint)point InsetWidth:(CGFloat)insetWidth outSetWidth:(CGFloat)outSetWidth;

/**
 开始呼吸动画
 */
- (void)startAnimation;

/**
 停止呼吸动画
 */
- (void)stopAnimation;

@end
