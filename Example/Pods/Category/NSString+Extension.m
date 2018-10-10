//
//  NSString+Extension.m
//  EBOexchange
//
//  Created by  ztryxh on 2017/10/13.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
//- (NSString *)md5Encrypt {
//    const char *original_str = [self UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(original_str, strlen(original_str), result);
//    NSMutableString *hash = [NSMutableString string];
//    for (int i = 0; i < 16; i++)
//        [hash appendFormat:@"%02X", result[i]];
//    return [hash lowercaseString];
//}
////SHA1加密方式
//
//- (NSString*) sha1
//{
//    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:self.length];
//    
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    
//    CC_SHA1(data.bytes, data.length, digest);
//    
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    
//    return output;
//}
- (NSString *)stringValue
{
    return self;
}
-(NSString *)changeInfo{
    
 
    if(self.length>7){
        
        NSString *tel = [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        return tel;
    }else{
        
        return self;
    }

}

- (NSString *)addstr:(NSString *)str{
    
    return [self stringByAppendingString:str];
}

- (BOOL)isPureInt{
    
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
    
}

- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}


-(NSString*)removeFloatAllZero
{
    
    NSString * testNumber = self;
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    
    //    价格格式化显示
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    NSString *formatterString = [formatter stringFromNumber:[NSNumber numberWithFloat:[outNumber doubleValue]]];
    
    NSRange range = [formatterString rangeOfString:@"."]; //现获取要截取的字符串位置
    NSLog(@"--------%lu",(unsigned long)range.length);
    
    if (range.length>0) {
        
        NSString * result = [formatterString substringFromIndex:range.location]; //截取字符串
        
        if (result.length>=4) {
            
            formatterString=[formatterString substringToIndex:formatterString.length-1];
        }
        
    }
    
    NSLog(@"Formatted number string:%@",formatterString);
    
    NSLog(@"Formatted number string:%@",outNumber);
    //    输出结果为：[1223:403] Formatted number string:123,456,789
//    [formatterString stringByReplacingOccurrencesOfString:@"," withString:@""];
    return   [formatterString stringByReplacingOccurrencesOfString:@"," withString:@""];
}

- (NSString *)changeStrWithLength:(NSInteger)length
{
    NSInteger Count = 0;
    NSInteger kMaxLength = length;
    NSString *toBeString = self;
    
    NSString *regex = @"[\u4e00-\u9fa5]";
    NSPredicate *ret = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    for (int i = 0; i < toBeString.length; i++) {
        NSString *str = [toBeString substringWithRange:NSMakeRange(i, 1)];
        if([ret evaluateWithObject:str])
        {
            Count += 2;
        }
        else
        {
            Count += 1;
        }
    }
    
    if (Count > kMaxLength) {
        return [self substringToIndex:kMaxLength];
        //        self = [toBeString substringToIndex:toBeString.length-1];
    }
    return self;
}

//-(NSString*)removeFloatAllZero
//{
//    NSString * testNumber = self;
//    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
//    return outNumber;
//}
@end
