//
//  ViewController2.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "ViewController2.h"
#import <GPUImage.h>
#import "GPUImage2x2FourSquaresFilter.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPUImage2x2FourSquaresFilter *filter = [[GPUImage2x2FourSquaresFilter alloc] init];
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
