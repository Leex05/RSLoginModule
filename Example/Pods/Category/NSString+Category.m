/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import "NSString+Category.h"

@implementation NSString (Category)

//根据字符串的字体和size(此处size设置为字符串宽和MAXFLOAT)返回多行显示时的字符串size
//- (CGSize)stringSizeWithFont:(UIFont *)font Size:(CGSize)size {
//    
//    CGSize resultSize;
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
//        //段落样式
//        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//        style.lineBreakMode = NSLineBreakByWordWrapping;
//        
//        //字体大小，换行模式
//        NSDictionary *attributes = @{NSFontAttributeName : font , NSParagraphStyleAttributeName : style};
//        resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//    } else {
//        //计算正文的高度
//        resultSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
//    }
//    return resultSize;
//}
#pragma mark -获取一段字符串中的中文字

-(NSArray *)getAStringOfChineseWord

{
    
    if (self == nil || [self isEqual:@""])
        
    {
        
        return nil;
        
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (int i=0; i<[self length]; i++)
        
    {
        
        int a = [self characterAtIndex:i];
        
        if (a < 0x9fff && a > 0x4e00)
            
        {
            
            [arr addObject:[self substringWithRange:NSMakeRange(i, 1)]];
            
        }
        
    }
    
    return arr;
    
}
@end
