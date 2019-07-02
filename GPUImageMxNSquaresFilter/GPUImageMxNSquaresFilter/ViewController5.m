//
//  ViewController5.m
//  GPUImageMxNSquaresFilter
//
//  Created by RMKJ on 2019/7/2.
//  Copyright © 2019 CoderYQ. All rights reserved.
//

#import "ViewController5.h"
#import <GPUImage.h>
#import "GPUImagePIPFilter.h"


@interface ViewController5 ()
@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;
@property (nonatomic, strong) GPUImageMovie *movieFile;
@property (weak, nonatomic) IBOutlet GPUImageView *cameraView;

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
    
    GPUImagePIPFilter *filter = [[GPUImagePIPFilter alloc] init];
    GPUImageNormalBlendFilter *filter1 = [[GPUImageNormalBlendFilter alloc] init];
    
    NSURL *sampleURL = [[NSBundle mainBundle] URLForResource:@"video" withExtension:@"mp4"];
    AVAsset *asset = [AVAsset assetWithURL:sampleURL];
    self.movieFile = [[GPUImageMovie alloc] initWithAsset:asset];
    self.movieFile.runBenchmark = YES;
    self.movieFile.playAtActualSpeed = YES;
    
    [self.videoCamera addTarget:filter];
    [self.movieFile addTarget:filter];
    [filter addTarget:self.cameraView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.videoCamera startCameraCapture];
    [self.movieFile startProcessing];
}


@end
