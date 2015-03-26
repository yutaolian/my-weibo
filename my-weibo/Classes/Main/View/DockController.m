//
//  DockController.m
//  Dock-Framework
//
//  Created by lyt on 15/3/12.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "DockController.h"

#define kDockHight 44

@interface DockController() <DockDelegate>

@end

@implementation DockController

-(void)loadView
{
    [super loadView];
    [self addDock];
}

//-(void)viewDidLoad
//{
//    [self addDock];
//}

#pragma mark - 添加dock
-(void)addDock
{
    //1.创建dock
    Dock *dock = [[Dock alloc] init];
    
   dock.frame = CGRectMake(0, self.view.frame.size.height-kDockHight, self.view.frame.size.width, kDockHight);
    
    dock.delegate = self;
    
    [self.view addSubview:dock];
    _dock =  dock;
}

#pragma mark - dock的代理方法
-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{

    if (to<0 || to>=self.childViewControllers.count)
        return;
    //0.移除旧的控制器
    
    UIViewController *oldVC = self.childViewControllers[from];
    
    [oldVC.view removeFromSuperview];
    
    //1.取出即将显示的控制器
    
    UIViewController *newVC = self.childViewControllers[to];
    
    CGFloat width = self.view.frame.size.width;
    // CGFloat height = self.view.frame.size.height -kDockHight -kStatusHeight;
    CGFloat height = self.view.frame.size.height -kDockHight ;
    newVC.view.frame = CGRectMake(0, 0, width, height);
    //2.添加新的控制器
    [self.view addSubview:newVC.view];
    
}

@end
