//
//  UILabel+CreatLabel.m
//  EBOexchange
//
//  Created by WWJ on 2017/12/27.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import "UILabel+CreatLabel.h"

@implementation UILabel (CreatLabel)
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.font = font;
    label.textColor = color;
    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text{
    UILabel *label = [UILabel labelWithFrame:frame font:font color:color];
    label.text = text;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}
+ (UILabel *)labelWithFont:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = text;
//    label.adjustsFontSizeToFitWidth = YES;
    return label;
}
+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    //    label.adjustsFontSizeToFitWidth = YES;
    return label;
}
@end
