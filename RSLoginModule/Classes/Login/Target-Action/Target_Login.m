//
//  Target_Login.m
//  RealShopping
//
//  Created by leex on 2018/10/9.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "Target_Login.h"
#import "LoginViewController.h"
#import "ProperyController.h"
#import "RegistViewController.h"
@implementation Target_Login
- (UIViewController *)Action_nativeLoginViewController:(NSDictionary *)params
{
    LoginViewController *viewController = [[LoginViewController alloc] init];
    return viewController;
}

- (UIViewController *)Action_nativeProperyViewController:(NSDictionary *)params
{
    if (params.count == 0) {
        //容错，没有传值跳转空控制器
        return [UIViewController new];
    }
    ProperyController *viewController = [[ProperyController alloc] init];
    viewController.properyType = [[params valueForKey:@"type"] integerValue];
    return viewController;
}

- (UIViewController *)Action_nativeRegistViewController:(NSDictionary *)params
{
    RegistViewController *viewController = [[RegistViewController alloc] init];
    viewController.invitaCode = [params valueForKey:@"invitaCode"];
    return viewController;
}
@end
