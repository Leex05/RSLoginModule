//
//  Account.h
//  EBOexchange
//
//  Created by  ztryxh on 2017/9/26.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
typedef NS_ENUM(NSUInteger,VIPLevel){
    VIPLevelNone = 0,//激活
    VIPLevelExtend = 1,//推广
    VIPLevelNormal = 2,//普通
    VIPLevelZero = 3,//文玩
    VIPLevelOne = 4,//茶具
    VIPLevelTwo = 5,//茶具
    VIPLevelThree = 6,//茶具
    VIPLevelFour = 7,//茶具
    VIPLevelAdmin = 9,//管理员
};
@interface Account : BaseModel<NSCoding>

@property(nonatomic,copy)NSString *token;//令牌
//@property(nonatomic,copy)NSString *username;//账号
@property(nonatomic,copy)NSString *promo_code1;//邀请码
@property(nonatomic,copy)NSString *petname;//昵称

@property(nonatomic,copy)NSString *anum;//金叶子
@property(nonatomic,copy)NSString *bnum;//银叶子
@property(nonatomic,copy)NSString *vip_lv;//vip等级

@property(nonatomic,copy)NSString *rmbnum;//账号
@property(nonatomic,copy)NSString *yjrmbnum;//邀请码
@property(nonatomic,copy)NSString *tasktag;//vip等级@property(nonatomic,copy)NSString *anum;//账号
@property(nonatomic,copy)NSString *times;//邀请码
@property(nonatomic,copy)NSString *password;//密码
@property(nonatomic,copy)NSString *pass;//密码

//@property(nonatomic,assign)VIPLevel vip_lv;//密码

@end
