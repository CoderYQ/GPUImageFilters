
## 01-GPUMxNSquaresFilter
<img width="250" height="445" style="margin: 0 auto" src="https://github.com/CoderYQ/GPUImageMxNSquaresFilter/blob/master/ScreenShots/01.gif"/>

[GPUMxNSquaresFilter](https://github.com/CoderYQ/GPUImageMxNSquaresFilter/tree/master/GPUImageMxNSquaresFilter/GPUImageMxNSquaresFilter/GPUMxNSquaresFilter) 是本人在工作中基于 GPUImage 框架开发的一款 filter，其效果在于能将画面分割成 m x n 个方格，每个方格能正常显示完整的画面，类似于九宫格的效果。该 filter 支持自定义分割参数，可以实现 2 x 2 、3 x 3 等任意你想要的效果。有兴趣的同学可以结合源码中的 [GPUImage2x2FourSquaresFilter](https://github.com/CoderYQ/GPUImageMxNSquaresFilter/tree/master/GPUImageMxNSquaresFilter/GPUImageMxNSquaresFilter) 和 [GPUImage3x3NineSquaresFilter](https://github.com/CoderYQ/GPUImageMxNSquaresFilter/tree/master/GPUImageMxNSquaresFilter/GPUImageMxNSquaresFilter/GPUImage3x3NineSquaresFilter) 探究实现原理。

## 02-GPUImageMagnifierFilter
<img width="250" height="445" style="margin: 0 auto" src="https://github.com/CoderYQ/GPUImageMxNSquaresFilter/blob/master/ScreenShots/03.gif"/>

[GPUImageMagnifierFilter](https://github.com/CoderYQ/GPUImageMxNSquaresFilter/tree/master/GPUImageMxNSquaresFilter/GPUImageMxNSquaresFilter/GPUImageMagnifierFilter) 同样基于 GPUImage 框架开发的一款 filter，其效果在于能够将画面中指定区域的图像进行缩放，支持自定义范围和缩放因子。

## 03-GPUImagePIPFilter
<img width="250" height="445" style="margin: 0 auto" src="https://github.com/CoderYQ/GPUImageMxNSquaresFilter/blob/master/ScreenShots/02.gif"/>

[GPUImagePIPFilter](https://github.com/CoderYQ/GPUImageMxNSquaresFilter/tree/master/GPUImageMxNSquaresFilter/GPUImageMxNSquaresFilter/GPUImageMagnifierFilter) 同样基于 GPUImage 框架开发的一款 filter，其效果在于能够结合两个视频源实现画中画效果，支持自定义小画面尺寸。
