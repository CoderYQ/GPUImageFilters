//
//  GPUImage2x2FourSquaresFilter.h
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * The filter can be used to divide image into 2 x 2 squares,
 * in each square, the image can be fully displayed
 
 * 本滤镜能够实现将画面切分成 2 x 2 个方格, 画面在每个方格中能够完全显示, 四宫格效果
 *
 * github: https://github.com/CoderYQ/GPUImageMxNSquaresFilter
 * @author CoderYQ
 * @createdAt 06/27/2019
 * QQ 13048976253
 */

extern NSString *const kGPUImage2x2FourSquaresFragmentShaderString;

@interface GPUImage2x2FourSquaresFilter : GPUImageFilter

@end

NS_ASSUME_NONNULL_END
