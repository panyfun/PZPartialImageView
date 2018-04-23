//
//  UIImageView+PZPartialImage.h
//  PZPartialImageDemo
//
//  Created by pany on 2018/4/20.
//  Copyright © 2018年 pany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (PZPartialImage)

@property (nonatomic, readonly) CGRect currentImageRect;

/**
 期望显示的图片区域
 */
- (void)pz_expectedRectOfImage:(CGRect)rect;

@end
