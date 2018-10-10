//
//  UILabel+CreatLabel.h
//  EBOexchange
//
//  Created by WWJ on 2017/12/27.
//  Copyright © 2017年 ebo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CreatLabel)
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color;
    
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text;
+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color
                      text:(NSString *)text;
+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color;
@end
