//
//  MBProgressHUD+show.h
//  EBOexchange
//
//  Created by  ztryxh on 2017/10/20.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
//#import "MBProgressHUD+show.h"
@interface MBProgressHUD (show)
+ (void)showErrorWithText:(NSString *)text;
+ (void)showSuccessWithText:(NSString *)text;

/**
 自定义时间的提示
 */
+ (void)showText:(NSString *)text time:(NSTimeInterval)time;
@end
