//
//  UIButton+Layout.m
//  EBOexchange
//
//  Created by  ztryxh on 2018/1/2.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import "UIButton+Layout.h"

@implementation UIButton (Layout)
-(void)sc_setLayoutStyle:(SCButtonLayoutStyle)style spacing:(CGFloat)spacing{
    
    
    // 强制更新布局，以获得最新的 imageView 和 titleLabel 的 frame
    [self layoutIfNeeded];
    
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    switch (style) {
        case SCButtonLayoutStyleImageLeft: {
            // 计算默认的图片文字间距
            CGFloat originalSpacing = titleFrame.origin.x - (imageFrame.origin.x + imageFrame.size.width);
            // 调整文字的位置
            self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                    -(originalSpacing - spacing/2 ),
                                                    0,
                                                    (originalSpacing - spacing/2 ));
            self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                    (originalSpacing - spacing/2 ),
                                                    0,
                                                    -(originalSpacing - spacing/2));
        }
            break;
            
        case SCButtonLayoutStyleImageRight: {
            // 图片右移
            self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                    titleFrame.size.width + spacing,
                                                    0,
                                                    -(titleFrame.size.width + spacing));
            // 文字左移
            self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                    -(titleFrame.origin.x - imageFrame.origin.x),
                                                    0,
                                                    titleFrame.origin.x - imageFrame.origin.x);
        }
            break;
            
        case SCButtonLayoutStyleImageTop: {
//             图片上移，右移
            self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                    (titleFrame.size.width),
                                                    titleFrame.size.height - spacing,
                                                    -(titleFrame.size.width));
            
            // 文字下移，左移
            self.titleEdgeInsets = UIEdgeInsetsMake(imageFrame.size.height + spacing/2,
                                                    -(imageFrame.size.width),
                                                    -spacing/2,
                                                    2);            
        }
            break;
            
        case SCButtonLayoutStyleImageBottom: {
            // 图片下移，右移
            self.imageEdgeInsets = UIEdgeInsetsMake(titleFrame.size.height + spacing,
                                                    0,
                                                    0,
                                                    -(titleFrame.size.width));
            // 文字上移，左移
            self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                    -(imageFrame.size.width),
                                                    imageFrame.size.height + spacing,
                                                    0);
            
        }
            break;
            
        default:
            break;
    }
    
}
@end
