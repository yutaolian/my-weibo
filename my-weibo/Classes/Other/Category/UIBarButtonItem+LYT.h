//
//  UIBarButtonItem+LYT.h
//  my-weibo
//
//  Created by lyt on 15/3/12.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LYT)

-(id)initWithNormalIcon:(NSString *) normalIcon andHighlightedIcon:(NSString *)highlightedIcon andTarget:(id)target andAction:(SEL) action;
+(id)barButtonItemWithNormalIcon:(NSString *) normalIcon andHighlightedIcon:(NSString *)highlightedIcon andTarget:(id)target andAction:(SEL) action;

@end
