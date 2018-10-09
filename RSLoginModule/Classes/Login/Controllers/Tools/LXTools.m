//
//  LXTools.m
//  RealShopping
//
//  Created by leex on 2018/9/5.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "LXTools.h"
#import "SAMKeychain.h"
@implementation LXTools
+ (void)countDown:(UIButton *)btn countdown:(int)kcountdown{
    __block int countdown;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [btn setEnabled:NO];
            countdown=kcountdown;
            //            [btn setBackgroundColor:[UIColor lightGrayColor]];
        });
        
        while (countdown>0) {
            
            if (--countdown>0) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [btn setTitle:[NSString stringWithFormat:@"%dS ",countdown] forState:UIControlStateNormal];
                });
                [NSThread sleepForTimeInterval:1.0f];
            }
            else
            {
                dispatch_sync(dispatch_get_main_queue(),^{
                    [btn setTitle:@"发送" forState:UIControlStateNormal];
                    [btn setEnabled:YES];
                });
                
            }
        }
    });
}

+ (NSString *)getDeviceId
{
    NSString * currentDeviceUUIDStr = [SAMKeychain passwordForService:@" "account:@"uuid"];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [SAMKeychain setPassword: currentDeviceUUIDStr forService:@" "account:@"uuid"];
    }
    return currentDeviceUUIDStr;
}

+ (UIImage *)createNonInterpolatedUIImageWithDataString:(NSString *)dataString withSize:(CGFloat) size
{    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    // 3.给过滤器添加数据(正则表达式/账号和密码)
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *image = [filter outputImage];
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
}
@end
