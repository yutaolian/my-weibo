//
//  NSString+LYT.m
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "NSString+LYT.h"

@implementation NSString (LYT)

#pragma mark -为字符串添加后缀生成图片名称

-(NSString *)fileAppend:(NSString *)append
{
    NSString *ext = [self pathExtension];
    //2.返回出去扩展名的图片名称
    
    NSString *imageName = [self stringByDeletingPathExtension];
    
    //3.拼接图片名称
    imageName = [imageName stringByAppendingString:append];
    
    //4。拼接扩展名
    return [imageName stringByAppendingPathExtension:ext];
    
}
@end
