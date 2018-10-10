//
//  UIView+Extension.h


#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

+ (CGSize) boundingRectWithSize:(NSString*) txt Font:(UIFont*) font Size:(CGSize) size;

/** 获取该view所在的控制器 */
- (UIViewController *)superViewController;

@end
