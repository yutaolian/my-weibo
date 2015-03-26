
//
//  DockItem.m
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "DockItem.h"
//dock中文字与图片的比例
#define kTitleRatio 0.3

#define kDockItemSelectedImage @"tabbar_slider.png"

@implementation DockItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //设置被选中时的背景
        [self setBackgroundImage:[UIImage imageNamed:kDockItemSelectedImage] forState:UIControlStateSelected];
        
    }
    return self;
}
#pragma mark - 覆盖父类在heightLight时的操作
-(void)setHighlighted:(BOOL)highlighted
{
    //什么都不写，
    //不调用super的方法。（调用的话就没有覆盖的意义了）
}

#pragma mark 调整内部ImageView的方法

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageHeight = contentRect.size.height * (1-kTitleRatio);
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部Lable的方法

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titlex = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height -titleHeight - 3;
    CGFloat titleWidth = contentRect.size.width;
 
    return CGRectMake(titlex, titleY, titleWidth, titleHeight);
}
@end
