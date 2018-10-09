//
//  CTMediator+Login.h
//  RealShopping
//
//  Created by leex on 2018/10/9.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, PropertyType){
    
    /**
     *  普通会员协议
     */
    PropertyTypeUser = 0,
    /**
     *  用户注册协议
     */
    PropertyTypeRegister = 1,
    /**
     *  推广会员协议
     */
    PropertyTypePromote = 2,
    /**
     *  惠享计划
     */
    PropertyTypePreferential = 3,
    /**
     *  退款说明
     */
    PropertyTypeReFund = 4,
    /**
     *  签到
     */
    PropertyTypeSignIn= 5,
    /**
     *  任务奖励
     */
    PropertyTypeTask = 6,
    
};

typedef NS_ENUM(NSUInteger, LoginModuleType){
    /**
     *  登陆
     */
    LoginModuleTypeLogin = 0,
    /**
     *  注册
     */
    LoginModuleTypeRegist = 1,
    /**
     *  协议
     */
    LoginModuleTypePropery = 2,
};



@interface CTMediator (Login)
/*
 * 登陆模块的控制器选择
 * type: LoginModuleType
 * params传参请看Target_Login.h
 */
- (UIViewController *)CTMediator_viewControllerType:(LoginModuleType)type params:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
