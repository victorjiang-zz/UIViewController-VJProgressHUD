//
//  MBProgressHUD+VJViewController.m
//  UIViewController+VJProgressHUD
//
//  Created by Victor Jiang on 6/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import "MBProgressHUD+VJViewController.h"

@implementation MBProgressHUD (VJViewController)

+ (MB_INSTANCETYPE)vj_addHUDTo:(UIView *)view
{
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    [view addSubview:hud];
    return hud;
}

- (void)vj_showTextHUD:(NSString *)text andHideAfterDelay:(NSTimeInterval)delay animated:(BOOL)animated
{
    if ([text length] == 0) {
        [self hide:animated afterDelay:delay];
        return;
    }
    
    self.mode = MBProgressHUDModeText;
    self.labelText = text;
    [self show:animated];
    [self hide:animated afterDelay:delay];
}

- (void)vj_showHUDWithText:(NSString *)text hudMode:(MBProgressHUDMode)mode animated:(BOOL)animated
{
    self.mode = mode;
    self.labelText = text;
    [self show:animated];
}

@end
