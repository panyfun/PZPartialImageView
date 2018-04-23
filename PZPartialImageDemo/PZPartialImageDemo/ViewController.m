//
//  ViewController.m
//  PZPartialImageDemo
//
//  Created by pany on 2018/4/20.
//  Copyright © 2018年 pany. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+PZPartialImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIImageView *imgView = [UIImageView new];
    imgView.bounds = CGRectMake(0, 0, 200, 200);
    imgView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.layer.masksToBounds = YES;
    [self.view addSubview:imgView];
    
    UIImage *img = [UIImage imageNamed:@"image.jpeg"];
    imgView.image = img;
    

    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [imgView pz_expectedRectOfImage:CGRectMake(0, 300, img.size.height, img.size.height)];
    } completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
