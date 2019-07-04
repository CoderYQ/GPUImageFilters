//
//  GPUImageMxNSquaresFilter.m
//  GPUImageMxNSquaresFilter
//
//  Created by CoderYQ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageMxNSquaresFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImageMxNSquaresFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 uniform highp int horizontalPart;
 
 uniform highp int verticalPart;
 
 void main()
 {
     highp vec2 textureCoord = textureCoordinate;
     
     //horizontal
     if (horizontalPart > 1) {
         highp float partF = float(horizontalPart);
         highp float reciprocal = 1.0 / partF;
         for (highp int i = 0; i < horizontalPart; i ++) {
             if (float(i) * reciprocal < textureCoord.s && textureCoord.s <= float(i + 1) * reciprocal) {
                 textureCoord.s = (textureCoord.s - float(i) * reciprocal) * partF;
                 break;
             }
         }
     }
     
     //vertical
     if (verticalPart > 1) {
         highp float partF = float(verticalPart);
         highp float reciprocal = 1.0 / partF;
         for (highp int i = 0; i < verticalPart; i ++) {
             if (float(i) * reciprocal < textureCoord.t && textureCoord.t <= float(i + 1) * reciprocal) {
                 textureCoord.t = (textureCoord.t - float(i) * reciprocal) * partF;
                 break;
             }
         }
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#else

NSString *const kGPUImageMxNSquaresFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 uniform int horizontalPart;
 
 uniform int verticalPart;
 
 void main()
 {
     vec2 textureCoord = textureCoordinate;
     
     //horizontal
     if (horizontalPart > 1) {
         float partF = float(horizontalPart);
         float reciprocal = 1.0 / partF;
         for (int i = 0; i < horizontalPart; i ++) {
             if (float(i) * reciprocal < textureCoord.s && textureCoord.s <= float(i + 1) * reciprocal) {
                 textureCoord.s = (textureCoord.s - float(i) * reciprocal) * partF;
                 break;
             }
         }
     }
     
     //vertical
     if (verticalPart > 1) {
         float partF = float(verticalPart);
         float reciprocal = 1.0 / partF;
         for (int i = 0; i < verticalPart; i ++) {
             if (float(i) * reciprocal < textureCoord.t && textureCoord.t <= float(i + 1) * reciprocal) {
                 textureCoord.t = (textureCoord.t - float(i) * reciprocal) * partF;
                 break;
             }
         }
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoord);
 }
 );

#endif

@implementation GPUImageMxNSquaresFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageMxNSquaresFragmentShaderString]))
    {
        return nil;
    }
    horizontalPartUniform = [filterProgram uniformIndex:@"horizontalPart"];
    verticalPartUniform = [filterProgram uniformIndex:@"verticalPart"];
    self.horizontalPart = 3;
    self.verticalPart = 3;
    return self;
}

- (void)setHorizontalPart:(NSUInteger)horizontalPart {
    _horizontalPart = horizontalPart;
    [self setInteger:(GLint)horizontalPart forUniform:horizontalPartUniform program:filterProgram];
}

- (void)setVerticalPart:(NSUInteger)verticalPart {
    _verticalPart = verticalPart;
    [self setInteger:(GLint)verticalPart forUniform:verticalPartUniform program:filterProgram];
}


@end
