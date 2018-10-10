//
//  UIButton+Layout.h
//  EBOexchange
//
//  Created by  ztryxh on 2018/1/2.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,SCButtonLayoutStyle){
    
    SCButtonLayoutStyleImageLeft,
    SCButtonLayoutStyleImageRight,
    SCButtonLayoutStyleImageTop,
    SCButtonLayoutStyleImageBottom,
};
@interface UIButton (Layout)
- (void)sc_setLayoutStyle:(SCButtonLayoutStyle)style spacing:(CGFloat)spacing;
@end
