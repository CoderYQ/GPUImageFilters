//
//  GPUImage3x3NineSquaresFilter.h
//  GPUImageMxNSquaresFilter
//
//  Created by CoderYQ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * The filter can be used to divide image into 3 x 3 squares,
 * in each square, the image can be fully displayed
 
 * 本滤镜能够实现将画面切分成 3 x 3 个方格, 画面在每个方格中能够完全显示, 九宫格效果
 *
 * github: https://github.com/CoderYQ/GPUImageFilters
 * @author CoderYQ
 * @createdAt 06/27/2019
 * QQ 13048976253
 */

extern NSString *const kGPUImage3x3NineSquaresFragmentShaderString;

@interface GPUImage3x3NineSquaresFilter : GPUImageFilter

@end

NS_ASSUME_NONNULL_END
