//
//  GPUImageMagnifierFilter.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "GPUImageMagnifierFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImageMagnifierFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 uniform highp vec2 center;
 uniform highp float radius;
 uniform highp float factor;
 
 void main()
 {
     highp vec2 textureCoordinateToUse = textureCoordinate;
     highp float dist = distance(center, textureCoordinate);
     
     if (factor > 0.0 && dist < radius) {
         textureCoordinateToUse -= center;
         textureCoordinateToUse = textureCoordinateToUse / factor;
         textureCoordinateToUse += center;
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoordinateToUse);
 }
 );

#else

NSString *const kGPUImageMagnifierFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 uniform vec2 center;
 uniform float radius;
 uniform float factor;
 
 void main()
 {
     vec2 textureCoordinateToUse = textureCoordinate;
     float dist = distance(center, textureCoordinate);
     
     if (dist < radius && factor > 0.0) {
         textureCoordinateToUse -= center;
         textureCoordinateToUse = textureCoordinateToUse / factor;
         textureCoordinateToUse += center;
     }
     
     gl_FragColor = texture2D(inputImageTexture, textureCoordinateToUse);
 }
 );

#endif

@implementation GPUImageMagnifierFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageMagnifierFragmentShaderString]))
    {
        return nil;
    }
    
    centerUniform = [filterProgram uniformIndex:@"center"];
    radiusUniform = [filterProgram uniformIndex:@"radius"];
    factorUniform = [filterProgram uniformIndex:@"factor"];
    
    self.center = CGPointMake(0.5, 0.5);
    self.radius = 0.3;
    self.factor = 1.5;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setInputRotation:(GPUImageRotationMode)newInputRotation atIndex:(NSInteger)textureIndex;
{
    [super setInputRotation:newInputRotation atIndex:textureIndex];
    [self setCenter:self.center];
}

- (void)setCenter:(CGPoint)center;
{
    _center = center;
    CGPoint rotatedPoint = [self rotatedPoint:center forRotation:inputRotation];
    [self setPoint:rotatedPoint forUniform:centerUniform program:filterProgram];
}

- (void)setRadius:(CGFloat)radius;
{
    _radius = radius;
    [self setFloat:radius forUniform:radiusUniform program:filterProgram];
}

- (void)setFactor:(CGFloat)factor;
{
    _factor = factor;
    [self setFloat:_factor forUniform:factorUniform program:filterProgram];
}

@end
