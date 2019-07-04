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
 
 uniform highp float width;
 uniform highp float height;
 
 void main()
 {
     highp vec2 textureCoord = textureCoordinate;
     
     if (textureCoord.s < width && textureCoord.t < height) {
         textureCoord.s *= (1.0 / width);
         textureCoord.t *= (1.0 / height);
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
 
 uniform float width;
 uniform float height;
 
 void main()
 {
     vec2 textureCoord = textureCoordinate;
     
     if (textureCoord.s < width && textureCoord.t < height) {
         textureCoord.s *= (1.0 / width);
         textureCoord.t *= (1.0 / height);
         gl_FragColor = texture2D(inputImageTexture2, textureCoord);
         
     } else {
         gl_FragColor = texture2D(inputImageTexture, textureCoord);
     }
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
    
    widthUniform = [filterProgram uniformIndex:@"width"];
    heightUniform = [filterProgram uniformIndex:@"height"];
    self.width = 0.4;
    self.height = 0.4;
    
    return self;
}

- (void)setWidth:(CGFloat)width {
    _width = width;
    [self setFloat:_width forUniform:widthUniform program:filterProgram];
}

- (void)setHeight:(CGFloat)height {
    _height = height;
    [self setFloat:_height forUniform:heightUniform program:filterProgram];
}

@end
