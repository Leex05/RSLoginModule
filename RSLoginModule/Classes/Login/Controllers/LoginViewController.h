//
//  LoginViewController.h
//  RealShopping
//
//  Created by leex on 2018/8/29.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSUInteger,LoginType){
    LoginTypePassword =0,//密码登录
    LoginTypeSell =1,//展页入口
};
@interface LoginViewController : BaseViewController

@property (assign,nonatomic) LoginType loginType;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *sellBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end
