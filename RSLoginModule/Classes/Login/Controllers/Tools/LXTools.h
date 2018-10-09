//
//  LXTools.h
//  RealShopping
//
//  Created by leex on 2018/9/5.
//  Copyright © 2018年 leex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LXTools : NSObject

/*
 *  获取设备udid
 */
+ (NSString *)getDeviceId;

/*
 *  验证码倒计时
 *  @parma btn 按钮
 *  @parma kcountdown 倒计时时长
 *  异步调用，主线程操作UI
 */
+ (void)countDown:(UIButton *)btn countdown:(int)kcountdown;

/*
 *  生成二维码
 *  @parma dataString 字符串
 *  @parma size 图片大小
 *  return UIImage
 */
+ (UIImage *)createNonInterpolatedUIImageWithDataString:(NSString *)dataString withSize:(CGFloat) size;
@end
