//
//  LoginViewController.m
//  RealShopping
//
//  Created by leex on 2018/8/29.
//  Copyright © 2018年 leex. All rights reserved.
//
#import "LoginViewController.h"
#import "RegistViewController.h"
#import "ResetPasswordController.h"
#import "PromoDetailsController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kNavBGColor;
    if (self.loginType == LoginTypeSell) {
        [self.forgetBtn removeFromSuperview];
        [self.sellBtn removeFromSuperview];
        [self.registBtn removeFromSuperview];
    }
    [self.accountField setValue:rgb(165,165,165) forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordField setValue:rgb(165,165,165) forKeyPath:@"_placeholderLabel.textColor"];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark --event
- (IBAction)loginBtnClick:(id)sender {
    if (self.loginType == LoginTypeSell) {
        NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
        [param setValue:self.accountField.text forKey:@"promo_code_ed"];
        [param setValue:self.passwordField.text forKey:@"password"];
        [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kCodeLoginUrl Parameters:param finished:^(id result, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([[result valueForKey:@"code"] integerValue] == 1000) {
                PromoDetailsController *vc = [PromoDetailsController new];
                vc.passWord = self.passwordField.text;
                vc.account = self.accountField.text;
                [self.navigationController pushViewController:vc animated:YES];
            }else
            {
                [MBProgressHUD showErrorWithText:[result valueForKey:@"msg"]];
            }
            
        }];
        return;
    }
    
    [UIScreen instancesRespondToSelector:@selector(currentMode)];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    [param setValue:self.accountField.text forKey:@"username"];
    [param setValue:self.passwordField.text forKey:@"password"];
    [param setValue:[LXTools getDeviceId] forKey:@"device_id"];
    [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kLoginUrl Parameters:param finished:^(id result, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[result valueForKey:@"code"] integerValue] == 1000) {
            Account *account=[[Account alloc]init];
            [account setValuesForKeysWithDictionary:[result valueForKey:@"body"]];
            account.pass = self.passwordField.text;
            [[AccountTools shared] AddUser:account];
            
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showErrorWithText:[result valueForKey:@"msg"]];
        }

    }];
}

- (IBAction)registBtnClick:(id)sender {
    RegistViewController *vc = [RegistViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sellBtnClick:(id)sender {
    LoginViewController *sellVC = [LoginViewController new];
    sellVC.loginType = LoginTypeSell;
    [self.navigationController pushViewController:sellVC animated:YES];
}

- (IBAction)forgetBtnClick:(id)sender {
    ResetPasswordController *vc = [ResetPasswordController new];
    [self.navigationController pushViewController:vc animated:YES];
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
