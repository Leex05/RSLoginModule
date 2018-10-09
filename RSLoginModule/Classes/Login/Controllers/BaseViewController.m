//
//  BaseViewController.m
//  Payment
//
//  Created by  ztryxh on 2018/2/27.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"
#import "MessageViewController.h"
#import "CartViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>
@end

@implementation BaseViewController
#pragma mark - life Cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
//    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
//
//    // handleNavigationTransition:为系统私有API,即系统自带侧滑手势的回调方法，我们在自己的手势上直接用它的回调方法
//
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//
//    panGesture.delegate = self; // 设置手势代理，拦截手势触发
//
//    [self.view addGestureRecognizer:panGesture];
    
    // 一定要禁止系统自带的滑动手势
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 1;

    UIImage *bgImage = [UIImage createImageWithColor:kNavBGColor];
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:17],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];

    if (![self isKindOfClass:[MessageViewController class]] && ![self isKindOfClass:[CartViewController class]]) {
        [self leftItemBack];//替换返回按钮
    }

}


// 什么时候调用，每次触发手势之前都会询问下代理方法，是否触发

// 作用：拦截手势触发

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer

{
    
    // 当当前控制器是根控制器时，不可以侧滑返回，所以不能使其触发手势
    
    if(self.navigationController.childViewControllers.count == 1)
        
    {
        
        return NO;
        
    }
    
    return YES;
    
}


-(void)leftItemBack{
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_left_arrow"] forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    [leftBtn addTarget:self action:@selector(returnbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtomItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtomItem;
}

- (BOOL)checkLogin
{
    if (![AccountTools shared].currentAccount.token) {
        
        UIViewController *vc = [[CTMediator sharedInstance] CTMediator_viewControllerType:LoginModuleTypeLogin params:nil];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}

-(void)returnbtn{
    [self.navigationController popViewControllerAnimated:YES];
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//#pragma mark - Privacy
//-(BOOL)checkLoginStatus{
//    
//    if([AccountTools shared].currentAccount){
//        return YES;
//    }else{
//        [AddressModel removeModel];
//                                                                                                                                                                                        [self popLoginView];
//        return NO;
//    }
//    
//}

@end
