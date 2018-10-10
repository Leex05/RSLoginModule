//
//  UrlConfig.h
//  JavaScriptCore-Demo
//
//  Created by leex on 2018/8/29.
//  Copyright © 2018年 www.skyfox.org. All rights reserved.
//

#ifndef UrlConfig_h
#define UrlConfig_h
#pragma mark - 配置
//是否开发模式
#define kDebug      YES
//服务器地址
#define kBaseUrl    kDebug?@"http://39.104.133.88:8080":@"http://39.104.133.88:8080"

#pragma mark - 账号系统
/**
 ** c
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 ** password：密码
 ** device_id：消息推送的设备号
 ** vcode：验证码
 **/
#define kLoginUrl   @"/RealShoppingServer/account/login"

/**
 ** 退出登陆
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 **/
#define kLogoutUrl   @"/RealShoppingServer/account/logout"

/**
 ** 修改密码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 ** password：密码
 ** token：令牌
 ** oldpassword：就密码
 **/
#define kModifyPasswordUrl   @"/RealShoppingServer/account/modifypassword"

/**
 ** 注册
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 ** password：密码
 ** vip_lv：账号类型（1：推广会员 2：普通会员）
 ** fileimgname：头像文件名
 ** petname：昵称
 ** promo_code_ed：邀请码
 ** vcode：验证码
 ** oldpassword：就密码
 **/
#define kRegistUrl   @"/RealShoppingServer/account/regist"

/**
 ** 修改资料
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** fileimgname：头像文件名
 ** petname：昵称
 **/
#define kModifyAccountUrl   @"/RealShoppingServer/account/modifyaccount"

/**
 ** 发送验证码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 **/
#define kSendCodeUrl   @"/RealShoppingServer/account/sendcode"

/**
 ** 忘记密码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** username:用户名
 ** password：密码
 ** vcode：验证码
 **/
#define kForgetPasswordUrl   @"/RealShoppingServer/account/forgetpassword"

/**
 ** 发送验证码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kGetUserinfoUrl   @"/RealShoppingServer/account/getuserinfo"

/**
 ** 发送验证码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** promo_code_ed:邀请码
 **/
#define kCodeLoginUrl   @"/RealShoppingServer/account/codelogin"

#pragma mark - 管理收货地址
/**
 ** 添加
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** name:收货人姓名
 ** phonenum:电话号码
 ** addr:收获地址
 ** tag：是否是默认地址（1：是；其他不是）
 ** detailed：详细地址
 **/
#define kAddAddressUrl   @"/RealShoppingServer/addr/add"

/**
 ** 修改
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** name:收货人姓名
 ** phonenum:电话号码
 ** addr:收获地址
 ** addr_id:数据ID
 ** tag：是否是默认地址（1：是；其他不是）
 ** detailed：详细地址
 **/
#define kUpdateAddressUrl   @"/RealShoppingServer/addr/update"

/**
 ** 查询
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kQueryAddressUrl   @"/RealShoppingServer/addr/query"

/**
 ** 删除
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** addr_id:数据ID
 **/
#define kDeleteAddressUrl   @"/RealShoppingServer/addr/delete"

#pragma mark - 申请推广码
/**
 ** 申请推广码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kPromoCodeUrl   @"/RealShoppingServer/code/promocode"

#pragma mark - 商品管理
/**
 ** 查询商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** name商品名称（支持模糊查询）
 ** pricea商品价格最小值
 ** priceb商品价格最大值
 ** category商品类别（支持模糊查询）
 ** start开始条数
 ** length数据长度
 **/
#define kQueryCommodityUrl   @"/RealShoppingServer/commodity/query"
/**
 ** 发布商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** name商品名称
 ** price商品价格
 ** category商品类别
 ** imglist(多个img缩略图) [{"imgfilename":"img1"},{"imgfilename":"img2"}]
 **/
#define kReleaseCommodityUrl   @"/RealShoppingServer/commodity/release"

/**
 ** 修改商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** name商品名称
 ** price商品价格
 ** category商品类别
 ** commodity_id:数据ID
 ** img(缩略图)
 **/
#define kUpdateCommodityUrl   @"/RealShoppingServer/commodity/update"

/**
 ** 删除商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** commodity_id:数据ID
 **/
#define kDeleteCommodityUrl   @"/RealShoppingServer/commodity/delete"

/**
 ** 首页商品推荐
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** start开始条数
 ** length数据长度
 **/
#define kRecommendCodeUrl   @"/RealShoppingServer/commodity/recommend"

/**
 ** 猜你喜欢
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** start开始条数
 ** length数据长度
 **/
#define kGuessLikeUrl   @"/RealShoppingServer/commodity/guess"

/**
 ** 人气推荐
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** start开始条数
 ** length数据长度
 **/
#define kPopularityUrl   @"/RealShoppingServer/commodity/popularity"

/**
 ** 品牌制造商
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** start开始条数
 ** length数据长度
 **/
#define kBrandUrl   @"/RealShoppingServer/commodity/brand"

/**
 ** 查看商品详情
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kCommodityDetailsUrl   @"/RealShoppingServer/commodity/details"

#pragma mark - 图片上传下载
/**
 ** 上传文件
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** 文件
 **/
#define kFileUploadsUrl   @"/RealShoppingServer/file/uploads"

/**
 ** 下载文件
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** filename:文件名
 **/
#define kFileDownloadUrl   @"/RealShoppingServer/file/download"

#pragma mark - 订单管理
/**
 ** 创建订单
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** state订单状态
 ** num商品数量
 ** commodity_id商品数据ID
 ** addr_id收货地址数据ID
 ** message留言
 ** cart_id购物车数据ID
 **/
#define kCreateOrderUrl   @"/RealShoppingServer/order/create"

/**
 ** 更改订单状态
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** state:订单状态
 ** order_id:订单数据ID
 **/
#define kUpdateOrderUrl   @"/RealShoppingServer/order/update"

/**
 ** 查询订单
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** state:订单状态
 **/
#define kQueryOrderUrl   @"/RealShoppingServer/order/query"

/**
 ** 删除订单
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** order_id：数据id
 **/
#define kDeleteOrderUrl   @"/RealShoppingServer/order/delete"

#pragma mark - 支付模块
/**
 ** 订单支付
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** paytype(充值1，支付2)
 ** myAmount:订单金额
 ** myGoodsName:商品名称
 ** addanum:金叶子
 ** addbnum:银叶子
 ** order_id：订单数据id
 **/
#define kPayGatewayUrl   @"/RealShoppingServer/pay/gateway"

/**
 ** 查询折扣
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kPayDiscountUrl   @"/RealShoppingServer/pay/discount"

/**
 ** 查询账号提现额度
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kPayQueryreFundUrl   @"/RealShoppingServer/pay/queryrefund"

/**
 ** 免密提现银行卡管理
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 **/
#define kPayWithoutBankUrl   @"/RealShoppingServer/pay/withoutbank"

/**
 ** 用户实名认证页入口
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** myuserName:用户姓名
 ** mymobiePhoneNo:手机号码
 ** myidentityNo:身份证
 ** mytransferAmount:转账金额
 **/
#define kPayCertidentityUrl   @"/RealShoppingServer/pay/certidentity"

/**
 ** 体现
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token：令牌
 ** order_id：数据id
 **/
#define kPayCashUrl   @"/RealShoppingServer/pay/cash"

#pragma mark - 签到模块
/**
 ** 签到
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kSignUrl   @"/RealShoppingServer/sign/sign"

#pragma mark - 任务模块
/**
 ** 查询邀请成功的人数,金叶子奖励数量
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kTaskQuerypersonaltaskUrl   @"/RealShoppingServer/task/querypersonaltask"

/**
 ** 个人任务领取奖励
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** people_num:邀请人数
 **/
#define kTaskGetpersonalanumUrl   @"/RealShoppingServer/task/getpersonalanum"

/**
 ** 查询上月邀请成功数量,最多的账号,成功数量,金叶子奖励数量
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kTaskQueryglobotaskUrl   @"/RealShoppingServer/task/queryglobotask"

/**
 ** 全局任务领取奖励
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kTaskGetgloboanumUrl   @"/RealShoppingServer/task/getgloboanum"

#pragma mark - 购物车模块
/**
 ** 添加至购物车
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** commodity_id:商品数据ID
 ** num:商品数量
 **/
#define kCartAddUrl   @"/RealShoppingServer/cart/addcart"

/**
 ** 删除购物车
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** cart_id:购物车数据ID
 ** people_num:邀请人数
 **/
#define kCartDeleteUrl   @"/RealShoppingServer/cart/deletecart"

/**
 ** 查询购物车
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kCartQueryUrl   @"/RealShoppingServer/cart/query"

/**
 ** 修改购物车，修改商品购买数量
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** cart_id:购物车数据ID
 ** num:商品数量
 **/
#define kCartUpdateUrl   @"/RealShoppingServer/cart/update"

#pragma mark - 收藏商品
/**
 ** 收藏商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** commodity_id:商品数据ID
 **/
#define kCollectionUrl   @"/RealShoppingServer/collection/collection"

/**
 ** 取消商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** commodity_id:商品数据ID
 **/
#define kCancelCollectionUrl   @"/RealShoppingServer/collection/cancelcollection"

/**
 ** 查询收藏商品
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 **/
#define kQueryCollectionUrl   @"/RealShoppingServer/collection/querycollection"

#pragma mark - 展业数据
/**
 ** 查询展业会员情况
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** vip_lv:会员等级
 **/
#define kSellAccountUrl   @"/RealShoppingServer/sell/account"

/**
 ** 展业界面
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** token:令牌
 ** starttime:开始时间
 ** endtime:结束时间
 **/
#define kSellUrl   @"/RealShoppingServer/sell/sell"

/**
 ** 查询单独的展业码
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** starttime:开始时间
 ** endtime:结束时间
 ** promocode:展业码
 **/
#define kSellCodeUrl   @"/RealShoppingServer/sell/sellcode"

#pragma mark - 推送模块
/**
 ** 推送
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 ** deviceIds：设备ID
 ** title：标题
 ** body：消息体
 **/
#define kPushUrl   @"/RealShoppingServer/push/push"

#pragma mark - 更新APP
/**
 ** 更新
 ** 请求类型:POST
 ** 参数类型:JSON
 ** @param
 **/
#define kAppUpdateUrl   @"/RealShoppingServer/file/appupdate"



#endif /* UrlConfig_h */
