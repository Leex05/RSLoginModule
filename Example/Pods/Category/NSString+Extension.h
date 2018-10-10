//
//  NSString+Extension.h
//  EBOexchange
//
//  Created by  ztryxh on 2017/10/13.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Extension)
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
//- (NSString *)md5Encrypt;
//- (NSString*) sha1;
-(NSString *)changeInfo;
-(NSString *)stringValue;
- (NSString *)addstr:(NSString *)str;
- (BOOL)isPureInt;
- (BOOL)isPureFloat;
-(NSString*)removeFloatAllZero;
- (NSString *)changeStrWithLength:(NSInteger)length;
@end
