//
//  UIViewController+VJProgressHUD.m
//  UIViewController+VJProgressHUD
//
//  Created by Victor Jiang on 6/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import "UIViewController+VJProgressHUD.h"
#import <objc/runtime.h>
#import "MBProgressHUD+VJViewController.h"

#pragma mark - UIView+VJProgressHUD

@implementation UIView (VJProgressHUD)

+ (void)load
{
    SEL originalSelector = @selector(didAddSubview:);
    SEL swizzledSelector = @selector(vj_didAddSubview:);
    
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    
    if (class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (MBProgressHUD *)vj_progressHUD
{
    return objc_getAssociatedObject(self, @selector(vj_progressHUD));
}

- (void)setVj_progressHUD:(MBProgressHUD *)vj_progressHUD
{
    objc_setAssociatedObject(self, @selector(vj_progressHUD), vj_progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)vj_setupProgressHUD
{
    if (self.vj_progressHUD) {
        return;
    }
    self.vj_progressHUD = [MBProgressHUD vj_addHUDTo:self];
}


- (void)vj_didAddSubview:(UIView *)subview{
    [self vj_didAddSubview:subview];
    
    if (self.vj_progressHUD) {
        [self bringSubviewToFront:self.vj_progressHUD];
    }
}

@end

#pragma mark - UIViewController+VJProgressHUD

@implementation UIViewController (VJProgressHUD)

- (MBProgressHUD *)vj_progressHUD
{
    if (!self.view.vj_progressHUD) {
        [self.view vj_setupProgressHUD];
    }
    
    return self.view.vj_progressHUD;
}

- (void)vj_showTextHUD:(NSString *)text
{
    [self vj_showTextHUD:text andHideAfterDelay:1.0f];
}

- (void)vj_showTextHUD:(NSString *)text andHideAfterDelay:(NSTimeInterval)delay
{
    [self.vj_progressHUD vj_showTextHUD:text andHideAfterDelay:delay animated:YES];
}

- (void)vj_showProgressHUD
{
    [self vj_showProgressHUDWithText:nil];
}

- (void)vj_showProgressHUDWithText:(NSString *)text
{
    [self vj_showHUDWithText:text hudMode:MBProgressHUDModeIndeterminate];
}

- (void)vj_showHUDWithText:(NSString *)text hudMode:(MBProgressHUDMode)mode
{
    [self.vj_progressHUD vj_showHUDWithText:text hudMode:mode animated:YES];
}

- (void)vj_hideHUD
{
    [self.vj_progressHUD hide:YES];
}

- (void)vj_hideHUDAfterDelay:(NSTimeInterval)delay
{
    [self.vj_progressHUD hide:YES afterDelay:delay];
}

@end

