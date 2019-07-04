//
//  GPUImage2x2FourSquaresFilter.m
//  GPUImageMxNSquaresFilter
//
//  Created by CoderYQ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImage2x2FourSquaresFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImage2x2FourSquaresFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 void main()
 {
     highp vec2 textureCoord = textureCoordinate;
     
     if (textureCoord.s <= 0.5) {
         textureCoord.s *= 2.0;
     } else {
         textureCoord.s = (textureCoord.s - 0.5) * 2.0;
     }
     
     if (textureCoord.t <= 0.5) {
         textureCoord.t *= 2.0;
     } else {
         textureCoord.t = (textureCoord.t - 0.5) * 2.0;
     }
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#else

NSString *const kGPUImage2x2FourSquaresFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 void main()
 {
     vec2 textureCoord = textureCoordinate;
     
     if (textureCoord.s <= 0.5) {
         textureCoord.s *= 2.0;
     } else {
         textureCoord.s = (textureCoord.s - 0.5) * 2.0;
     }
     
     if (textureCoord.t <= 0.5) {
         textureCoord.t *= 2.0;
     } else {
         textureCoord.t = (textureCoord.t - 0.5) * 2.0;
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#endif

@implementation GPUImage2x2FourSquaresFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImage2x2FourSquaresFragmentShaderString]))
    {
        return nil;
    }
    return self;
}


@end
