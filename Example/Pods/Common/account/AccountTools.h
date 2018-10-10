//
//  AccountTools.h
//  EBOexchange
//
//  Created by  ztryxh on 2017/9/26.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountTools : NSObject
@property (nonatomic,strong) Account *currentAccount;
+(AccountTools *)shared;
-(void)AddUser:(Account *)account;
-(void)userLogOff;
-(void)updateUserInfo:(Account *)account;
@end
