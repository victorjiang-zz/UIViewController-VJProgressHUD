//
//  UIViewController+VJProgressHUD.h
//  UIViewController+VJProgressHUD
//
//  Created by Victor Jiang on 6/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

#pragma mark - UIView+VJProgressHUD

@interface UIView (VJProgressHUD)

/**
 *  The HUD that added on self
 */
@property (strong, nonatomic,readonly) MBProgressHUD *progressHUD;

/**
 *  Setup the progressHUD
 *  If the property progressHUD is nil, create a new progressHUD, and add it on self.
 */
- (void)vj_setupProgressHUD;

@end

#pragma mark - UIViewController+VJProgressHUD

@interface UIViewController (VJProgressHUD)

/**
 *  Get the HUD that added on self.view
 *
 *  @return HUD
 */
- (MBProgressHUD *)vj_progressHUD;

/**
 *  Display the HUD only with a text, and hide it after 1s automaticly.
 *
 *  @param text The text that will be displayed
 */
- (void)vj_showTextHUD:(NSString *)text;

/**
 *  Display the HUD only with a text, and hide it after a delay.
 *
 *  @param text  The text that will be dispalyed
 *  @param delay The seconds that the HUD will be hidden
 */
- (void)vj_showTextHUD:(NSString *)text andHideAfterDelay:(NSTimeInterval)delay;

/**
 *  Display the HUD only with a UIActivityIndicatorView, without any text.
 */
- (void)vj_showProgressHUD;

/**
 *  Display the HUD with a UIActivityIndicatorView, and also with a text.
 */
- (void)vj_showProgressHUDWithText:(NSString *)text;

/**
 *  Display the HUD with the specified mode, and also can with a text.
 *
 *  @param text The text that will be displayed
 *  @param mode The specified HUD's mode
 */
- (void)vj_showHUDWithText:(NSString *)text hudMode:(MBProgressHUDMode)mode;

/**
 *  Hide the HUD with an animation
 */
- (void)vj_hideHUD;

/**
 *  Hide the HUD with an animation after a delay
 *
 *  @param delay The seconds that the HUD will be hidden
 */
- (void)vj_hideHUDAfterDelay:(NSTimeInterval)delay;

@end
