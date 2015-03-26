//
//  Dock.m
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"

#define kDockBackgroundImage @"tabbar_background.png"

@interface Dock()
{
    
    DockItem *_selectedItem;
}
@end
@implementation Dock

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor=  [UIColor colorWithPatternImage:[UIImage imageNamed:kDockBackgroundImage]];
    }
    return self;
}


#pragma mark - 添加一个选项卡
-(void) addItemWithIcon:(NSString *)icon selectedIcon:(NSString *) selected title:(NSString *)title
{
    DockItem *dockItem = [[DockItem alloc]init];
    
    [dockItem setTitle:title forState:UIControlStateNormal];
    //设置默认图片
    [dockItem setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    
    //设置选中图片
    [dockItem setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    //添加item时应该为item绑定点击监听事件
    
    [dockItem addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    //添加item
    [self addSubview:dockItem];
    
    //设置item的位置
    NSInteger count = self.subviews.count;
    if(count==1)
    {
        [self itemClick:dockItem];
    }
    CGFloat width = self.frame.size.width / count;
    CGFloat height = self.frame.size.height;
    
    for (int i = 0; i< count; i++) {
        
        DockItem *item = self.subviews[i];
        
        item.tag = i;
        
        item.frame = CGRectMake(width * i, 0, width, height);
        
        
        
    }
}


#pragma mark -
#pragma mark 监听item的点击事件
-(void)itemClick:(DockItem *)item
{
    
    //0.通知代理
    if([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)])
    {
        [_delegate dock:self itemSelectedFrom:_selectedItem.tag to:item.tag];
    }
    //1.取消以前选中的Item
    
    _selectedItem.selected = NO;
    
    //2.选中当前Item
    item.selected = YES;
    
    //3.更新选中
    
    _selectedItem = item;
}



@end

