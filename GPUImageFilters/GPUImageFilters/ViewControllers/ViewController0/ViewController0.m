//
//  ViewController0.m
//  GPUImageFilters
//
//  Created by RMKJ on 2019/7/3.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "ViewController0.h"
#import "GPUImageMxNSquaresFilter.h"
#import <GPUImage.h>

@interface ViewController0 ()

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;

@property (weak, nonatomic) IBOutlet GPUImageView *cameraView;

@property (nonatomic, strong) GPUImageMxNSquaresFilter *filter;

@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filter = [[GPUImageMxNSquaresFilter alloc] init];
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
    [self.videoCamera addTarget:self.filter];
    [self.filter addTarget:self.cameraView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.videoCamera startCameraCapture];
}

- (void)dealloc {
    [self.videoCamera stopCameraCapture];
}

- (IBAction)horizonalValueChanged:(UIStepper *)sender {
    self.filter.horizontalPart = sender.value;
}

- (IBAction)verticalValueChanged:(UIStepper *)sender {
    self.filter.verticalPart = sender.value;
}

@end
