//
//  ResetPasswordController.m
//  RealShopping
//
//  Created by leex on 2018/9/5.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "ResetPasswordController.h"
#import "LXTools.h"

@interface ResetPasswordController ()
@property (strong,nonatomic) UITextField *accountField;
@property (strong,nonatomic) UITextField *vCodeField;
@property (strong,nonatomic) UITextField *passwordField;
@end

@implementation ResetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"重置密码";
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)setupViews
{
    CGFloat height = kScaleWidth(44);
    CGFloat padding = kScaleWidth(40);
    NSArray *placeholderArr = @[@"输入手机号",@"输入验证码",@"输入新密码，至少6位"];
    for (int i = 0; i < 3; i++) {
        UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(padding, padding + height * i, kScreenWidth - padding * 2, height)];
        field.placeholder = placeholderArr[i];
        field.font = kFont(14);
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(field.yzLeft, field.yzBottom, field.yzWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
        [self.view addSubview:field];
        [self.view addSubview:line];
        switch (i) {
            case 0:{
                self.accountField = field;
                self.accountField.keyboardType = UIKeyboardTypeNumberPad;
            }
                break;
            case 1:{
                self.vCodeField = field;
                self.vCodeField.keyboardType = UIKeyboardTypeNumberPad;
                UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, height)];
                sendBtn.titleLabel.font = kFont(14);
                [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
                [[sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                    sendBtn.userInteractionEnabled = NO;
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
                    [param setValue:self.accountField.text forKey:@"username"];
                    [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kSendCodeUrl Parameters:param finished:^(id result, NSError *error) {
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        sendBtn.userInteractionEnabled = YES;
                        if ([[result valueForKey:@"code"] integerValue] == 1000) {
                            [LXTools countDown:sendBtn countdown:60];
                        }else
                        {
                            [MBProgressHUD showErrorWithText:[result valueForKey:@"msg"]];
                        }
                    }];
                }];
                [sendBtn setTitleColor:kRedColor forState:UIControlStateNormal];
                self.vCodeField.rightView = sendBtn;
                self.vCodeField.rightViewMode = UITextFieldViewModeAlways;
            }
                break;
            case 2:{
                self.passwordField = field;
            }
                break;
                
            default:
                break;
        }
    }
    
    UIButton *sureBtn = [UIButton new];
    sureBtn.backgroundColor = kRedColor;
    sureBtn.layer.cornerRadius = 4;
    sureBtn.layer.masksToBounds = YES;
    [sureBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.passwordField);
        make.top.mas_equalTo(self.passwordField.mas_bottom).mas_offset(30);
    }];
    [[sureBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        sureBtn.userInteractionEnabled = NO;
        NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
        [param setValue:self.accountField.text forKey:@"username"];
        [param setValue:self.passwordField.text forKey:@"password"];
        [param setValue:self.vCodeField.text forKey:@"vcode"];
        [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kForgetPasswordUrl Parameters:param finished:^(id result, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            sureBtn.userInteractionEnabled = YES;
            if ([[result valueForKey:@"code"] integerValue] == 1000) {
                [MBProgressHUD showSuccessWithText:@"重置密码成功请登录"];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showErrorWithText:[result valueForKey:@"msg"]];
            }
        }];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
