//
//  MBProgressHUD+show.m
//  EBOexchange
//
//  Created by  ztryxh on 2017/10/20.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import "MBProgressHUD+show.h"

@implementation MBProgressHUD (show)
+(void)showText:(NSString *)text name:(NSString *)name {
    [self showText:text name:name time:2];
}

+(void)showText:(NSString *)text name:(NSString *)name time:(NSTimeInterval)time
{
    // 显示加载失败
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    // 显示一张图片(mode必须写在customView设置之前)
    hud.mode = MBProgressHUDModeCustomView;
    // 设置一张图片
    name = [NSString stringWithFormat:@"MBProgressHUD.bundle/%@", name];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
    
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒后自动隐藏

    [hud hideAnimated:YES afterDelay:time];
    
}
+ (void)showErrorWithText:(NSString *)text
{
      [self showText:text name:@"error.png"];
}

+ (void)showSuccessWithText:(NSString *)text{
    
    [self showText:text name:@"success.png"];
}
+ (void)showText:(NSString *)text time:(NSTimeInterval)time{
    [self showText:text name:@"" time:time];
}

@end
