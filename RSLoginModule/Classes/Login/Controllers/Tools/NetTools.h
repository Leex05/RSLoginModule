//
//  NetTools.h
//  封装AFN
//
//  Created by 田智广 on 15/12/31.
//  Copyright © 2015年 田智广. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef enum : NSUInteger {
    GET,
    POST,

} method;

@interface NetTools : AFHTTPSessionManager


+(instancetype)sharedNetTools;



-(void)loadDataWithMethod:(method)method UrlString:(NSString *)urlString Parameters:(id)parameters finished:(void(^)(id result, NSError * error))finished;

-(void)uploadDataWith:(NSString *)urlString Parameters:(id)parameters DataArr:(NSArray *)dataArr fileName:(NSString *)fileName finished:(void(^)(id result, NSError * error))finished;

@end
