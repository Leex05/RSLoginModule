//
//  RegistViewController.m
//  RealShopping
//
//  Created by leex on 2018/9/5.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "RegistViewController.h"
#import "XXLinkLabel.h"
#import "LXTools.h"
@interface RegistViewController ()
{
    BOOL isAgree;
}
@property (strong,nonatomic) UITextField *accountField;
@property (strong,nonatomic) UITextField *vCodeField;
@property (strong,nonatomic) UITextField *passwordField;
@property (strong,nonatomic) UITextField *invitaCodeField;
@property (strong, nonatomic)  NSMutableArray *messageModels;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新用户注册";
    [self setupViews];
    self.invitaCodeField.text = self.invitaCode;
}

- (void)setupViews
{
    CGFloat height = kScaleWidth(44);
    CGFloat padding = kScaleWidth(40);
    NSArray *placeholderArr = @[@"输入手机号",@"短信验证码",@"设置密码，至少6位",@"邀请码"];
    for (int i = 0; i < 4; i++) {
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
                UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, height)];
                sendBtn.titleLabel.font = kFont(14);
                [sendBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
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
            case 3:{
                self.invitaCodeField = field;
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
    [sureBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
    
    XXLinkLabel *lab = [[XXLinkLabel alloc]init];
    lab.numberOfLines = 0;
    lab.font = kFont(13);
    lab.text = @"已阅读并同意以下协议《用户注册协议及隐私政策》";
    [self.view addSubview:lab];
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.invitaCodeField);
        make.top.mas_equalTo(self.invitaCodeField.mas_bottom).mas_offset(30);
    }];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.invitaCodeField);
        make.top.mas_equalTo(sureBtn.mas_bottom).mas_offset(24);
    }];
    
    self.messageModels = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        XXLinkLabelModel *messageModel = [[XXLinkLabelModel alloc]init];
        
        if (i == 0) {
            messageModel.message = @"已阅读并同意以下协议";
            messageModel.image = kImageNamed(@"icon_unagree");
            messageModel.imageShowSize = CGSizeMake(18, 18);
        }
        if (i == 1) {
            messageModel.message = @"《用户注册协议及隐私政策》";
            messageModel.imageClickBackStr =@"《用户注册协议及隐私政策》";
            messageModel.extend = @1;
        }
        [self.messageModels addObject:messageModel];
        
    }
    WeakSelf(weakSelf);
    __weak typeof (lab) weakLab = lab;

    lab.messageModels = self.messageModels;
    lab.imageClickBlock = ^(XXLinkLabelModel *linkInfo) {
        self->isAgree = !self->isAgree;
        linkInfo.image = self->isAgree?kImageNamed(@"icon_agree"):kImageNamed(@"icon_unagree");
        weakLab.messageModels = weakSelf.messageModels;
    };
    lab.labelClickedBlock = ^(id extend) {
        UIViewController *vc = [[CTMediator sharedInstance] CTMediator_viewControllerType:LoginModuleTypeRegist params:@{@"type":@(PropertyTypeRegister)}];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    [[sureBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (!self->isAgree) {
            [MBProgressHUD showErrorWithText:@"请先同意注册协议"];
            return ;
        }
        sureBtn.userInteractionEnabled = NO;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
        [param setValue:self.accountField.text forKey:@"username"];
        [param setValue:self.passwordField.text forKey:@"password"];
        [param setValue:self.vCodeField.text forKey:@"vcode"];
        [param setValue:self.invitaCodeField.text forKey:@"promo_code_ed"];
        [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kRegistUrl Parameters:param finished:^(id result, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            sureBtn.userInteractionEnabled = YES;
            if ([[result valueForKey:@"code"] integerValue] == 1000) {
                [MBProgressHUD showSuccessWithText:@"注册成功"];
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
