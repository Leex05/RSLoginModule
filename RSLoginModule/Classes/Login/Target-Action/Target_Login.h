//
//  Target_Login.h
//  RealShopping
//
//  Created by leex on 2018/10/9.
//  Copyright © 2018年 leex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_Login : NSObject
/*
 * 登陆控制器
 * @params
 * 无需传值 nil
 */
- (UIViewController *)Action_nativeLoginViewController:(NSDictionary *)params;
/*
 * 协议控制器
 * @params
 * type: 必传，PropertyType枚举类型
 */
- (UIViewController *)Action_nativeProperyViewController:(NSDictionary *)params;
/*
 * 注册控制器
 * @params
 * invitaCode: 可选，扫描二维码后的邀请码字符串
 */
- (UIViewController *)Action_nativeRegistViewController:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
