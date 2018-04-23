//
//  UIImageView+PZPartialImage.m
//  PZPartialImageDemo
//
//  Created by pany on 2018/4/20.
//  Copyright © 2018年 pany. All rights reserved.
//

#import "UIImageView+PZPartialImage.h"
#import <objc/runtime.h>


@implementation UIImageView (PZPartialImage)

- (CGRect)currentImageRect {
    if (!self.image) {
        return CGRectZero;
    }
    
    CGRect layerRect = self.layer.contentsRect;
    CGSize imageSize = self.image.size;
    CGRect curRect;
    curRect.origin.x = layerRect.origin.x * imageSize.width;
    curRect.origin.y = layerRect.origin.y * imageSize.height;
    curRect.size.width = layerRect.size.width * imageSize.width;
    curRect.size.height = layerRect.size.height * imageSize.height;
    return curRect;
}

- (void)pz_expectedRectOfImage:(CGRect)rect {
    CGRect layerRect = CGRectMake(0, 0, 1, 1);
    if (self.image && CGRectEqualToRect(CGRectZero, rect)) {
        CGSize imageSize = self.image.size;
        layerRect.origin.x = rect.origin.x / imageSize.width;
        layerRect.origin.y = rect.origin.y / imageSize.height;
        layerRect.size.width = rect.size.width / imageSize.width;
        layerRect.size.height = rect.size.height / imageSize.height;
        layerRect = CGRectIntersection(layerRect, CGRectMake(0, 0, 1, 1));
        if (CGRectIsNull(layerRect) || CGRectIsEmpty(layerRect)) {
            layerRect = CGRectMake(0, 0, 1, 1);
        }
    }
    
    self.layer.contentsRect = layerRect;
}

@end
