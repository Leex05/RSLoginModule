//
//  UIImage+Color.m
//  MeidaHealth
//
//  Created by 韩菲菲 on 2017/6/8.
//  Copyright © 2017年 meida. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
//把UIimage集成圆角（优化）
-(void)qi_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage*))completion{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        UIGraphicsBeginImageContextWithOptions(size, true, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        [fillColor setFill];
        UIRectFill(rect);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path addClip];
        [self drawInRect:rect];
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result != nil) {
                completion(result);
            }
        });
    });
        

    
}

@end
