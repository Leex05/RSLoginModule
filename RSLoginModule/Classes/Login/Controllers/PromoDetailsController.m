//
//  PromoDetailsController.m
//  RealShopping
//
//  Created by leex on 2018/9/26.
//  Copyright © 2018年 leex. All rights reserved.
//
#import "VipInfoScvoModel.h"
#import "PromoDetailsController.h"
#import "PromoCodeController.h"
@interface PromoDetailsController ()
{
    NSString *_dateStr;
    BOOL _isFrom;
}
@property (nonatomic, strong) VipInfoScvoModel *model;

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIView *handleView;
@property (nonatomic, strong) UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *invitaLab;
@property (weak, nonatomic) IBOutlet UIButton *fromBtn;
@property (weak, nonatomic) IBOutlet UIButton *tobtn;

@end

@implementation PromoDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"展业码信息";
    [self.fromBtn setTitle:self.model.from forState:UIControlStateNormal];
    [self.tobtn setTitle:self.model.to forState:UIControlStateNormal];

    // Do any additional setup after loading the view from its nib.
}

//关闭datapicker
- (void)disMiss
{
    [_bgView removeFromSuperview];
    [_handleView removeFromSuperview];
    [_datePicker removeFromSuperview];
    //    _dateStr = nil;
    _bgView = nil;
    _handleView = nil;
    _datePicker = nil;
}

//确定日期
- (void)sureAction
{
    [self disMiss];
    
    if (!_dateStr) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        _dateStr = [formatter  stringFromDate:[NSDate date]];
    }
    if (_isFrom) {
        [self.fromBtn setTitle:_dateStr forState:UIControlStateNormal];
    }else
    {
        [self.tobtn setTitle:_dateStr forState:UIControlStateNormal];
    }
}


- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy-MM-dd";
    _dateStr = [formatter  stringFromDate:datePicker.date];
}


- (void)showDataPickerWithFrom:(BOOL)isFrom
{
    _isFrom = isFrom;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.bgView];
    [window addSubview:self.datePicker];
    [window addSubview:self.handleView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(window);
    }];
    [self.handleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(window);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.datePicker.mas_top);
    }];
}

- (IBAction)fromBtnClick:(id)sender {
    [self showDataPickerWithFrom:YES];
}

- (IBAction)toBtnCLick:(id)sender {
    [self showDataPickerWithFrom:NO];
}
- (IBAction)queryBtnClick:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    [param setValue:self.account forKey:@"promocode"];
    [param setValue:self.model.from forKey:@"starttime"];
    [param setValue:self.model.to forKey:@"endtime"];
    [param setValue:[AccountTools shared].currentAccount.vip_lv forKey:@"vip_lv"];
    [[NetTools sharedNetTools] loadDataWithMethod:POST UrlString:kSellCodeUrl Parameters:param finished:^(id result, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[result valueForKey:@"code"] integerValue] == 1000) {
            [MBProgressHUD showSuccessWithText:@"查询成功"];
            self.titleLab.text = @"详细信息";
            [self.model setValuesForKeysWithDictionary:[result valueForKey:@"body"]];
            self.moneyLab.text = [@"总金额:" stringByAppendingString:[self.model.totalnum stringValue]];
            self.numLab.text = [@"总销量:" stringByAppendingString:[self.model.sellnum stringValue]];
            self.invitaLab.text = [NSString stringWithFormat:@"总邀请:%@",self.model.paynum];

        }else
        {
            [MBProgressHUD showErrorWithText:[result valueForKey:@"msg"]];
        }
    }];
}
- (IBAction)nextBtnClick:(id)sender {
    PromoCodeController *vc = [[PromoCodeController alloc] initWithNibName:@"PromoCodeController" bundle:nil];
    vc.account = self.account;
    [self.navigationController pushViewController:vc animated:YES];
}


- (UIDatePicker*)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.backgroundColor = [UIColor whiteColor];
        //设置地区: zh-中国
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        
        //设置日期模式(Displays month, day, and year depending on the locale setting)
        _datePicker.datePickerMode = UIDatePickerModeDate;
        // 设置当前显示时间
        [_datePicker setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_datePicker setMaximumDate:[NSDate date]];
        
        //设置时间格式
        
        //监听DataPicker的滚动
        [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _datePicker;
}


- (UIView *)handleView
{
    if (!_handleView) {
        _handleView = [UIView new];
        _handleView.backgroundColor = [UIColor whiteColor];
        UIButton *cancelBtn = [UIButton new];
        UIButton *sureBtn = [UIButton new];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:kRedColor forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = kFont(14);
        
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn setTitleColor:kRedColor forState:UIControlStateNormal];
        sureBtn.titleLabel.font = kFont(14);
        [cancelBtn addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
        [_handleView addSubview:sureBtn];
        [_handleView addSubview:cancelBtn];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(cancelBtn.superview);
            make.width.mas_equalTo(60);
        }];
        [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(sureBtn.superview);
            make.width.mas_equalTo(60);
        }];
    }
    return _handleView;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.1f];
    }
    return _bgView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (VipInfoScvoModel *)model
{
    if (!_model) {
        _model = [VipInfoScvoModel new];
        _model.username = self.account;
        _model.password = self.passWord;
        _model.from = @"2018-07-25";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *dateStr = [formatter  stringFromDate:[NSDate date]];
        _model.to = dateStr;
    }
    return _model;
}
@end
