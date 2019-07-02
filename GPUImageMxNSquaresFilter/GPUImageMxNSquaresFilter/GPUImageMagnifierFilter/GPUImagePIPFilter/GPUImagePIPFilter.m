//
//  GPUImagePIPFilter.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/7/2.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImagePIPFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImagePIPFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 varying highp vec2 textureCoordinate2;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 //小窗口的尺寸大小
 const highp float smallWindowWH = 0.333;
 
 void main()
 {
     highp vec2 textureCoord = textureCoordinate;
     /**
      将小窗口放在视频的左上方位置
      */
     if (textureCoord.s < smallWindowWH && textureCoord.t < smallWindowWH) {
         textureCoord.s *= 3.0;
         textureCoord.t *= 3.0;
         gl_FragColor = texture2D(inputImageTexture2, textureCoord);
         
     } else {
         gl_FragColor = texture2D(inputImageTexture, textureCoord);
     }
 }
);
#else
NSString *const kGPUImagePIPFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 varying vec2 textureCoordinate2;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 void main()
 {
     
 }
);
#endif

@implementation GPUImagePIPFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImagePIPFragmentShaderString]))
    {
        return nil;
    }
    
    return self;
}

@end
