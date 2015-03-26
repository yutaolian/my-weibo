
//
//  UIBarButtonItem+LYT.m
//  my-weibo
//
//  Created by lyt on 15/3/12.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "UIBarButtonItem+LYT.h"

@implementation UIBarButtonItem (LYT)

-(id)initWithNormalIcon:(NSString *)normalIcon andHighlightedIcon:(NSString *)highlightedIcon andTarget:(id)target andAction:(SEL)action
{
    
    //创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *image = [UIImage imageNamed:normalIcon];
    //设置图片及样式
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedIcon] forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置按钮大小
    btn.bounds = (CGRect){CGPointZero,image.size};
    
    return [self initWithCustomView:btn];
    
}
+(id)barButtonItemWithNormalIcon:(NSString *)normalIcon andHighlightedIcon:(NSString *)highlightedIcon andTarget:(id)target andAction:(SEL)action
{
    
    return [[self alloc] initWithNormalIcon:normalIcon andHighlightedIcon:highlightedIcon andTarget:target andAction:action];
    
}

@end
