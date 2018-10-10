//
//  AccountTools.m
//  EBOexchange
//
//  Created by  ztryxh on 2017/9/26.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import "AccountTools.h"

#define kDocFileName @"account.plist"
#define kPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:kDocFileName]
static AccountTools *_instance;
@implementation AccountTools

+(AccountTools *)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    
    return _instance;
}
-(id)init{
    
    if(self=[super init]){
        NSFileManager *file = [NSFileManager defaultManager];
        if([file fileExistsAtPath:kPath]){
            
              _currentAccount=[NSKeyedUnarchiver unarchiveObjectWithFile:kPath];
        }
        
    }
    return self;
}
-(void)AddUser:(Account *)account{
    
    _currentAccount = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kPath];
    
}
-(void)userLogOff{
    
    NSFileManager *file = [NSFileManager defaultManager];
    if([file fileExistsAtPath:kPath]){
        
        [file removeItemAtPath:kPath error:nil];
    }
    _currentAccount=nil;
}
-(void)updateUserInfo:(Account *)account{
    
    if(_currentAccount==nil){
        
        return;
    }
    
    _currentAccount=account;
    [NSKeyedArchiver archiveRootObject:account toFile:kPath];
}
@end
