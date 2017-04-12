//
//  ImageCroper.m
//  CropImage
//
//  Created by administrator on 2017/4/12.
//  Copyright © 2017年 softcity. All rights reserved.
//

#import "ImageCroper.h"

@implementation ImageCroper

- (NSArray<UIImage *>*)cropNineImage:(UIImage *)image
{
    NSMutableArray *imageArr = @[].mutableCopy;
    for (int i = 0; i < 9; i ++) {
        CGFloat x = (i % 3) *image.size.width / 3;
        CGFloat y = (i / 3) *image.size.height / 3;
        CGRect temp_rect = (CGRect){x,y,image.size.width/3,image.size.height/3};
        CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], temp_rect);
        [imageArr addObject:[UIImage imageWithCGImage:imageRef]];
        CGImageRelease(imageRef);
    }
    return imageArr.copy;
}

@end
