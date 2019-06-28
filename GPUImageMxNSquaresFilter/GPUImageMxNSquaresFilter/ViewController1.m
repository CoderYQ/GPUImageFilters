//
//  ViewController1.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/6/27.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "ViewController1.h"
#import <GPUImage.h>
#import "GPUImageMxNSquaresFilter.h"

@interface ViewController1 ()

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;
@property (weak, nonatomic) IBOutlet GPUImageView *cameraView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) GPUImagePicture *picture;

@property (nonatomic, strong) GPUImageMxNSquaresFilter *filter1;
@property (nonatomic, strong) GPUImageMxNSquaresFilter *filter2;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //摄像
    self.filter1 = [[GPUImageMxNSquaresFilter alloc] init];
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
    [self.videoCamera addTarget:self.filter1];
    [self.filter1 addTarget:self.cameraView];
    
    //图片
    self.filter2 = [[GPUImageMxNSquaresFilter alloc] init];
    [self.filter2 forceProcessingAtSize:self.imageView.bounds.size];
    [self.filter2 useNextFrameForImageCapture];
    UIImage *image = [UIImage imageNamed:@"icon"];
    self.picture = [[GPUImagePicture alloc] initWithImage:image];
    [self.picture addTarget:self.filter2];
    [self.picture processImage];
    UIImage *filterImage = [self.filter2 imageFromCurrentFramebuffer];
    self.imageView.image = filterImage;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.videoCamera startCameraCapture];
}

- (IBAction)horizonalValueChanged:(UIStepper *)sender {
    self.filter1.horizontalPart = sender.value;
}

- (IBAction)verticalValueChanged:(UIStepper *)sender {
     self.filter1.verticalPart = sender.value;
}

@end
