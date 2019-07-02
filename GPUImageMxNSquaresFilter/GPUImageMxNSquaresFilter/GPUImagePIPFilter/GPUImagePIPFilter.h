//
//  GPUImagePIPFilter.h
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/7/2.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageTwoInputFilter.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * The filter can be used to mix two videos to achieve a picture-in-picture effect
 
 * 本滤镜能够实现混合两个视频实现画中画功能
 *
 * github: https://github.com/CoderYQ/GPUImageMxNSquaresFilter
 * @author CoderYQ
 * @createdAt 06/27/2019
 * QQ 13048976253
 */

extern NSString *const kGPUImagePIPFragmentShaderString;

@interface GPUImagePIPFilter : GPUImageTwoInputFilter

@end

NS_ASSUME_NONNULL_END
