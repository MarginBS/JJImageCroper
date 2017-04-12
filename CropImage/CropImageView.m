//
//  CropImageView.m
//  CropImage
//
//  Created by administrator on 2017/4/12.
//  Copyright © 2017年 softcity. All rights reserved.
//

#import "CropImageView.h"
#import "ImageCroper.h"

#define IMAGE_MARGIN 2
#define LINECOUNT 3

@implementation CropImageView

- (instancetype)initCropImageViewWith:(UIImage *)image
{
    if (self = [super init]) {
        NSArray *images = [ImageCroper.new cropNineImage:image];
        for (UIImage *image in images) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            [self addSubview:imageView];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    NSArray *subs = self.subviews;
    int i = 0;
    CGFloat w = (self.frame.size.width -(LINECOUNT-1) * IMAGE_MARGIN) / LINECOUNT;
    CGFloat h = (self.frame.size.height -(LINECOUNT-1) * IMAGE_MARGIN) / LINECOUNT;
    for (UIImageView *imageView in subs) {
        CGFloat x = (i % LINECOUNT) * (w + IMAGE_MARGIN);
        CGFloat y = (i / LINECOUNT) * (h + IMAGE_MARGIN);
        imageView.frame = CGRectMake(x, y, w, h);
        i++;
    }
}

@end
