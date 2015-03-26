//
//  UIImage+Lyt.h
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Lyt)
#pragma mark 加载全屏图片
+(UIImage *) fullScreenImage:(NSString *)imageName;
+(UIImage *)resizedImage:(NSString *)imageName;

@end
