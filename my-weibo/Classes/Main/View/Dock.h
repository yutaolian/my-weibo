//
//  Dock.h
//  my-weibo
//
//  Created by lyt on 15/3/10.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dock;
@protocol DockDelegate <NSObject>
//optional的作用时代理方法可以实现也可以不实现
@optional
-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;

@end

@interface Dock : UIView

#pragma mark 添加一个选项卡
-(void) addItemWithIcon:(NSString *)icon selectedIcon:(NSString *) selected title:(NSString *)title;

@property (nonatomic,weak) id<DockDelegate> delegate;

@end
