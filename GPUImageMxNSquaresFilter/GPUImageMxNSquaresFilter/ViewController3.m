//
//  ViewController3.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "ViewController3.h"
#import <GPUImage.h>
#import "GPUImage3x3NineSquaresFilter.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPUImage3x3NineSquaresFilter *filter = [[GPUImage3x3NineSquaresFilter alloc] init];
    [filter forceProcessingAtSize:self.imageView.bounds.size];
    [filter useNextFrameForImageCapture];
    UIImage *image = [UIImage imageNamed:@"icon"];
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:image];
    [picture addTarget:filter];
    [picture processImage];
    UIImage *filterImage = [filter imageFromCurrentFramebuffer];
    self.imageView.image = filterImage;
}

@end
