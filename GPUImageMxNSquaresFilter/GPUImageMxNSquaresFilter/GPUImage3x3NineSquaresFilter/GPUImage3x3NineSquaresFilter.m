//
//  GPUImage3x3NineSquaresFilter.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImage3x3NineSquaresFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImage3x3NineSquaresFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 void main()
 {
     highp vec2 textureCoord = textureCoordinate;
     
     if (textureCoord.s <= 0.333) {
         textureCoord.s *= 3.0;
     } else if (textureCoord.s <= 0.666) {
         textureCoord.s = (textureCoord.s - 0.333) * 3.0;
     } else {
         textureCoord.s = (textureCoord.s - 0.666) * 3.0;
     }
     
     if (textureCoord.t <= 0.333) {
         textureCoord.t *= 3.0;
     } else if (textureCoord.t <= 0.666) {
         textureCoord.t = (textureCoord.t - 0.333) * 3.0;
     } else {
         textureCoord.t = (textureCoord.t - 0.666) * 3.0;
     }
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#else

NSString *const kGPUImage3x3NineSquaresFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 void main()
 {
    vec2 textureCoord = textureCoordinate;

     if (textureCoord.s <= 0.333) {
         textureCoord.s *= 3.0;
     } else if (textureCoord.s <= 0.666) {
         textureCoord.s = (textureCoord.s - 0.333) * 3.0;
     } else {
         textureCoord.s = (textureCoord.s - 0.666) * 3.0;
     }
     
     if (textureCoord.t <= 0.333) {
         textureCoord.t *= 3.0;
     } else if (textureCoord.t <= 0.666) {
         textureCoord.t = (textureCoord.t - 0.333) * 3.0;
     } else {
         textureCoord.t = (textureCoord.t - 0.666) * 3.0;
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#endif

@implementation GPUImage3x3NineSquaresFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImage3x3NineSquaresFragmentShaderString]))
    {
        return nil;
    }
    return self;
}

@end
