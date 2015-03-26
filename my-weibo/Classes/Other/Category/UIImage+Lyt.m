//
//  UIImage+Lyt.m
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//


#import "UIImage+Lyt.h"
#import "Common.h"
#import "NSString+LYT.h"


@implementation UIImage (Lyt)

#pragma mark 加载全屏图片
+(UIImage *) fullScreenImage:(NSString *)imageName
{
   //根据屏幕尺寸加载不同的图片
    //这样类似判断iPhone6 iPhone6p
    //是iPhone5
    if(iphone5)
    {
//        //1.获得图片的扩展名
//        NSString *ext = [imageName pathExtension];
//        //2.返回出去扩展名的图片名称
//        
//        imageName = [imageName stringByDeletingPathExtension];
//        
//        //3.拼接图片名称
//        imageName = [imageName stringByAppendingString:@"-568h@2x"];
//        
//        //4。拼接扩展名
//        imageName = [imageName stringByAppendingPathExtension:ext];
        
        //NSLog(@"%@",imageName);
        //MyLog(@"%@",imageName);
        
        imageName = [imageName fileAppend:@"-568h@2x"];
        
    }
    
    
    return [self imageNamed:imageName];
}

#pragma mark - 拉伸图片
+(UIImage *)resizedImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
