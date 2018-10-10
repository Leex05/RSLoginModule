//
//  Account.m
//  EBOexchange
//
//  Created by  ztryxh on 2017/9/26.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import "Account.h"

@implementation Account



-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.promo_code1 = [aDecoder decodeObjectForKey:@"promo_code1"];
        self.petname = [aDecoder decodeObjectForKey:@"petname"];

        self.anum = [aDecoder decodeObjectForKey:@"anum"];
        self.bnum = [aDecoder decodeObjectForKey:@"bnum"];
        self.vip_lv = [aDecoder decodeObjectForKey:@"vip_lv"];
        self.rmbnum = [aDecoder decodeObjectForKey:@"rmbnum"];
        self.yjrmbnum = [aDecoder decodeObjectForKey:@"yjrmbnum"];
        self.tasktag = [aDecoder decodeObjectForKey:@"tasktag"];
        self.times = [aDecoder decodeObjectForKey:@"times"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.pass = [aDecoder decodeObjectForKey:@"pass"];

    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.promo_code1 forKey:@"promo_code1"];
    [aCoder encodeObject:self.petname forKey:@"petname"];
    [aCoder encodeObject:self.anum forKey:@"anum"];
    [aCoder encodeObject:self.bnum forKey:@"bnum"];
    [aCoder encodeObject:self.vip_lv forKey:@"vip_lv"];
    [aCoder encodeObject:self.rmbnum forKey:@"rmbnum"];
    [aCoder encodeObject:self.yjrmbnum forKey:@"yjrmbnum"];
    [aCoder encodeObject:self.tasktag forKey:@"tasktag"];
    [aCoder encodeObject:self.times forKey:@"times"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.pass forKey:@"pass"];


}

@end
