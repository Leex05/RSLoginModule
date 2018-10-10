//
//  PromoCodeController.m
//  RealShopping
//
//  Created by leex on 2018/9/26.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "PromoCodeController.h"
#import "LXTools.h"
#import "MBProgressHUD.h"
@interface PromoCodeController ()
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@property (weak, nonatomic) IBOutlet UIImageView *codeView;

@end

@implementation PromoCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"展业码信息";
    self.codeView.image = [LXTools createNonInterpolatedUIImageWithDataString:self.account withSize:kScreenWidth - 80];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)saveBtnClick:(id)sender {
    [self loadImageFinished:self.codeView.image];
}
- (void)loadImageFinished:(UIImage*)image
{
    UIImageWriteToSavedPhotosAlbum(image,self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error)
    {
        [MBProgressHUD showSuccessWithText:@"保存成功"];
    }
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
