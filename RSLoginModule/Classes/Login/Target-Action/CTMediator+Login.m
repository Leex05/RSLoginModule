//
//  CTMediator+Login.m
//  RealShopping
//
//  Created by leex on 2018/10/9.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "CTMediator+Login.h"
//根据不同枚举类型获取对应方法名
NSString * NSStringFromLoginModuleType(LoginModuleType type) {
    switch (type) {
        case LoginModuleTypeLogin:
            return @"nativeLoginViewController";
        case LoginModuleTypeRegist:
            return @"nativeRegistViewController";
        case LoginModuleTypePropery:
            return @"nativeProperyViewController";
        default:
            return nil;
    }
};
@implementation CTMediator (Login)
- (UIViewController *)CTMediator_viewControllerType:(LoginModuleType)type params:(NSDictionary *)params;
{
    UIViewController *viewController = [self performTarget:@"Login"
                                                    action:NSStringFromLoginModuleType(type)
                                                    params:params
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
