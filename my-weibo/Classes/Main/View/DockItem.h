//
//  DockItem.h
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
// dock中的一个选项卡

#import <UIKit/UIKit.h>

@interface DockItem : UIButton

@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) UILabel *itemName;

@end
