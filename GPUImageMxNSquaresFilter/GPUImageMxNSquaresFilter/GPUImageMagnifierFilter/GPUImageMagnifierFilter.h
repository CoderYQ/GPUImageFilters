//
//  GPUImageMagnifierFilter.h
//  GPUImageMxNSquaresFilter
//
//  Created by CoderYQ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * The filter can be used to zoom in or out of the picture partialy
 * Similar to a magnifying glass
 
 * 本滤镜能够实现画面中的局部放大或缩小效果, 类似于放大镜
 *
 * github: https://github.com/CoderYQ/GPUImageFilters
 * @author CoderYQ
 * @createdAt 06/27/2019
 * QQ 13048976253
 */

extern NSString *const kGPUImageMagnifierFragmentShaderString;

@interface GPUImageMagnifierFilter : GPUImageFilter
{
    GLint centerUniform, radiusUniform, factorUniform;
}

/**
 The center about which to apply the operation, with a default of (0.5, 0.5)
 需要缩放的圆心坐标位置, 默认 (0.5, 0.5)
 */
@property(readwrite, nonatomic) CGPoint center;

/**
 The radius of the circle, with a minimum of 0.0 and a default of 0.3
 需要放大的圆的半径, 最小 0.0 默认 0.3
 */
@property(readwrite, nonatomic) CGFloat radius;

/**
 The scale factor of the circle, with a minimum of 0.0 and a default of 1.5
  缩放系数, 最小 0.0 默认 1.5
 */
@property(readwrite, nonatomic) CGFloat factor;

@end

NS_ASSUME_NONNULL_END
