//
//  BaseModel.h
//  Wallet
//
//  Created by 贺庆博 on 2018/4/10.
//  Copyright © 2018年 WWJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property (copy,nonatomic) NSString *username;
@property (strong,nonatomic) NSString *from;
@property (strong,nonatomic) NSString *to;
@end
