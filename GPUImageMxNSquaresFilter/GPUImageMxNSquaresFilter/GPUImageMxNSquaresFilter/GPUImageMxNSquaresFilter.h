//
//  GPUImageMxNSquaresFilter.h
//  GPUImageMxNSquaresFilter
//
//  Created by CoderYQ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * The filter can be used to divide image into m x n squares,
 * in each square, the image can be fully displayed
 
 * 本滤镜能够实现将画面切分成 m x n 个方格, 画面在每个方格中能够完全显示
 *
 * @author CoderYQ
 * @createdAt 06/27/2019
 * QQ 13048976253
 */

extern NSString *const kGPUImageMxNSquaresFragmentShaderString;

@interface GPUImageMxNSquaresFilter : GPUImageFilter
{
    GLint horizontalPartUniform, verticalPartUniform;
}

/**
 How many parts do you want to divide horizontally. The default is 3
 Can be set to 1、2、3 etc. The larger the number, the smaller the each square
 
 水平方向上想要切分成几份(默认是3), 可以设置为 1、2、3 等等, 数字越大，每个方格面积越小
 */
@property (nonatomic, assign) NSUInteger horizontalPart;

/**
 How many parts do you want to divide vertically. The default is 3
 Can be set to 1、2、3 etc. The larger the number, the smaller the each square
 
 竖直方向上想要切分成几份(默认是3), 可以设置为 1、2、3 等等, 数字越大，每个方格面积越小
 */
@property (nonatomic, assign) NSUInteger verticalPart;

@end

NS_ASSUME_NONNULL_END
