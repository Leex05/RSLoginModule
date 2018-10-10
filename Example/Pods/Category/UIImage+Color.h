//
//  UIImage+Color.h
//  MeidaHealth
//
//  Created by 韩菲菲 on 2017/6/8.
//  Copyright © 2017年 meida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage*) createImageWithColor: (UIColor*) color;
-(void)qi_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage*))completion;
@end
