//
//  NetTools.m
//  封装AFN
//
//  Created by 田智广 on 15/12/31.
//  Copyright © 2015年 田智广. All rights reserved.
//

#import "NetTools.h"

@protocol NetToolsProxy <NSObject>

@optional

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end


@interface NetTools () <NetToolsProxy>

@end

@implementation NetTools

+(instancetype)sharedNetTools{
    
    

    
    static NetTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
      
//       NSURL *url=[NSURL URLWithString:@"http://192.168.3.26:8090"];
//        NSURL *url=[NSURL URLWithString:@"https://192.168.3.111:8443"];
        //NSURL *url=[NSURL URLWithString:@"http://192.168.3.26:8090"];
//        NSURL *url=[NSURL URLWithString:@"https://api.govstardc.cn"];
        NSURL *url = [NSURL URLWithString:kBaseUrl];
        
       
        tools=[[self alloc]initWithBaseURL:url];
        tools.requestSerializer = [AFJSONRequestSerializer serializer];
        [tools.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     
        //[tools.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        
  
     tools.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/javascript", @"text/plain",nil];
        //设置网络超时
        tools.requestSerializer.timeoutInterval = 15;
        
        //配置证书
        //[tools setSecurityPolicy:[self customSecurityPolicy]];
    
    });
    
//    if([AccountTools shared].currentAccount){
//        
//        [tools.requestSerializer setValue:[AccountTools shared].currentAccount.authKey forHTTPHeaderField:@"authkey"];
//    }
   
    
    return tools;
    
}

-(void)loadDataWithMethod:(method)method UrlString:(NSString *)urlString Parameters:(id)parameters finished:(void(^)(id result, NSError * error))finished{

    NSString *methodName=(method==GET)?@"GET":@"POST";
    NSLog(@"参数%@=====%@",urlString,parameters);
    [[self dataTaskWithHTTPMethod:methodName URLString:urlString parameters:parameters uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * dataTask, id responseObject) {
        
        if (finished) {
            
            NSLog(@"%@",responseObject);
            finished(responseObject,nil);
        }

        
    } failure:^(NSURLSessionDataTask *dataTask, NSError *error) {

        if (finished) {
            
            NSLog(@"%@",error);
            finished(nil,error);
        }
//
        [MBProgressHUD showErrorWithText:@"服务器错误"];

    }] resume];


}
    

-(void)uploadDataWith:(NSString *)urlString Parameters:(id)parameters DataArr:(NSArray *)dataArr fileName:(NSString *)fileName finished:(void(^)(id result, NSError * error))finished{
    
    [self POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i=0; i<dataArr.count; i++) {
            
            NSData *d=[dataArr objectAtIndex:i];
            NSString *n=[self getCurrentTimes];
            
            //上传文件参数
            [formData appendPartWithFileData:d name:fileName fileName:[NSString stringWithFormat:@"%@.jpg",n] mimeType:@"image/jpeg"];
        }
       
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (finished) {
            
            finished(responseObject,nil);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (finished) {

            finished(nil,error);
        }
        [MBProgressHUD showErrorWithText:@"服务器错误"];
        NSLog(@"%@",error);
    }];
    
}


+ (AFSecurityPolicy *)customSecurityPolicy {
    
    // 先导入证书 证书由服务端生成，具体由服务端人员操作
    NSString *cerPath = [[NSBundle mainBundle]pathForResource:@"kaituo" ofType:@"cer"];//证书的路径 xx.cer
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES;
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    return securityPolicy;
}


//获取当前的时间
-(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMddHHmm"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
  
    return currentTimeString;
    
}



@end
