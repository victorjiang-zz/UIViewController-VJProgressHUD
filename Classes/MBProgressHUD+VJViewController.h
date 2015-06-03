//
//  MBProgressHUD+VJViewController.h
//  UIViewController+VJProgressHUD
//
//  Created by Victor Jiang on 6/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (VJViewController)

/**
 *  Create a new HUD, adds it to provided view, but not shows it.
 *
 *  @param view The view that the HUD will be added to
 *
 *  @return A refrence to the create HUD.
 */
+ (MB_INSTANCETYPE)vj_addHUDTo:(UIView *)view;

/**
 *  Display the HUD only with a text, the current mode is MBProgressHUDModeText. And hide the HUD after a delay.
 *
 *  @param text  The text will be shown
 *  @param delay    Delay in seconds until the HUD is hidden.
 *  @param animated If set to YES the HUD will disappear using the current animationType. If set to NO the HUD will not use animations while disappearing.
 */
- (void)vj_showTextHUD:(NSString *)text andHideAfterDelay:(NSTimeInterval)delay animated:(BOOL)animated;

/**
 *  Display the HUD with a text.
 *
 *  @param text  The text will be shown
 *  @param mode  Set the HUD's display mode
 *  @param animated If set to YES the HUD will appear using the current animationType. If set to NO the HUD will not use animations while appearing.
 */
- (void)vj_showHUDWithText:(NSString *)text hudMode:(MBProgressHUDMode)mode animated:(BOOL)animated;

@end
