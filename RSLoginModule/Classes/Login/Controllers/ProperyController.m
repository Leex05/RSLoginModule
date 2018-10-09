//
//  ProperyController.m
//  RealShopping
//
//  Created by leex on 2018/9/5.
//  Copyright © 2018年 leex. All rights reserved.
//

#import "ProperyController.h"

@interface ProperyController ()<NSXMLParserDelegate>
//添加属性
@property (nonatomic, strong) NSXMLParser *par;


@property (nonatomic, strong) NSMutableArray *list;
//标记当前标签，以索引找到XML文件内容
@property (nonatomic, copy) NSString *currentElement;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation ProperyController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadFileWithTitle:(NSString*)title name:(NSString*)name type:(NSString*)type
{
    self.navigationItem.title = title;
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)setProperyType:(PropertyType)properyType
{
    _properyType = properyType;
    switch (properyType) {
        case PropertyTypeRegister:{
            [self loadFileWithTitle:@"用户注册协议" name:@"Register" type:@"docx"];
        }
            break;
        case PropertyTypeUser:{
            [self loadFileWithTitle:@"普通会员协议" name:@"User" type:@"docx"];
        }
            break;
        case PropertyTypePromote:{
            [self loadFileWithTitle:@"推广会员协议" name:@"Promote" type:@"doc"];
        }
            break;
        case PropertyTypePreferential:{
            [self loadFileWithTitle:@"惠享计划" name:@"Preferential" type:@"docx"];
        }
            break;
        default:{
            self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
            self.textView.font = kFont(14);
            self.textView.textColor = [UIColor blackColor];
            [self.view addSubview:self.textView];
            [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            }];
            NSString* path =  [[NSBundle mainBundle] pathForResource:@"strings_agree" ofType:@"xml"];
            NSData *data = [[NSData alloc] initWithContentsOfFile:path options:(NSDataReadingMappedIfSafe) error:nil];
            self.par = [[NSXMLParser alloc]initWithData:data];
            //添加代理
            self.par.delegate = self;
            self.list = [NSMutableArray array];
            
            //初始化数组，存放解析后的数据
            [self.par parse];
        }
            break;
    }

}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidStartDocument...");
}
//准备节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    
    self.currentElement = elementName;
    
    if ([self.currentElement isEqualToString:@"string"]){
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:[attributeDict valueForKey:@"name"] forKey:@"name"];
        [self.list addObject:dict];
    }
    
}
//获取节点内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    NSMutableDictionary *dict = [self.list lastObject];
    NSString *str = [[NSString stringWithFormat:@"%@",[dict valueForKey:@"string"]] stringByAppendingString:string];
    [dict setValue:str forKey:@"string"];
    
}

//解析完一个节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    

    self.currentElement = nil;
}

//解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidEndDocument...");
    switch (self.properyType) {
//        case PropertyTypeUser:{
//            self.navigationItem.title = @"普通会员协议";
//            NSString *str1;
//            NSString *str2;
//            for (NSDictionary *dic in self.list) {
//                if ([[dic valueForKey:@"name"] isEqualToString:@"member_agree_1"]) {
//                    str1 = [dic valueForKey:@"string"];
//                }
//                if ([[dic valueForKey:@"name"] isEqualToString:@"member_agree_2"]) {
//                    str2 = [dic valueForKey:@"string"];
//                }
//            }
//            NSString *str = [[str1 stringByAppendingString:str2] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
//            [self setTextViewText:str];
//
//        }
//            break;
//
//        case PropertyTypeRegister:{
//            self.navigationItem.title = @"用户注册协议";
//            for (NSDictionary *dic in self.list) {
//                if ([[dic valueForKey:@"name"] isEqualToString:@"register_agree"]) {
//                    NSString *str = [[dic valueForKey:@"string"] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
//                    [self setTextViewText:str];
//                }
//            }
//
//        }
//            break;
//        case PropertyTypePromote:{
//            self.navigationItem.title = @"推广会员协议";
//            for (NSDictionary *dic in self.list) {
//                if ([[dic valueForKey:@"name"] isEqualToString:@"promote_agree"]) {
//                    NSString *str = [[dic valueForKey:@"string"] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
//                    [self setTextViewText:str];
//                }
//            }
//        }
//            break;
//        case PropertyTypePreferential:{
//            self.navigationItem.title = @"惠享计划";
//            NSString *str1;
//            NSString *str2;
//            for (NSDictionary *dic in self.list) {
//                if ([[dic valueForKey:@"name"] isEqualToString:@"preferential_agree1"]) {
//                    str1 = [dic valueForKey:@"string"];
//                }
//                if ([[dic valueForKey:@"name"] isEqualToString:@"preferential_agree2"]) {
//                    str2 = [dic valueForKey:@"string"];
//                }
//            }
//            NSString *str = [[str1 stringByAppendingString:str2] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
//            [self setTextViewText:str];
//        }
//            break;
//        case PropertyTypeUser: {
//            <#code#>
//            break;
//        }
//        case PropertyTypeRegister: {
//            <#code#>
//            break;
//        }
//        case PropertyTypePromote: {
//            <#code#>
//            break;
//        }
//        case PropertyTypePreferential: {
//            <#code#>
//            break;
//        }
        case PropertyTypeReFund:{
            self.navigationItem.title = @"退款说明";
            for (NSDictionary *dic in self.list) {
                if ([[dic valueForKey:@"name"] isEqualToString:@"refund_introduces"]) {
                    NSString *str = [[dic valueForKey:@"string"] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
                    [self setTextViewText:str];
                }
            }
            break;
        }
        case PropertyTypeSignIn:{
            self.navigationItem.title = @"签到攻略";
            for (NSDictionary *dic in self.list) {
                if ([[dic valueForKey:@"name"] isEqualToString:@"signin_agree"]) {
                    NSString *str = [[dic valueForKey:@"string"] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];

                    [self setTextViewText:str];
                }
            }
        }
            break;
        case PropertyTypeTask:{
            self.navigationItem.title = @"任务奖励";
            for (NSDictionary *dic in self.list) {
                if ([[dic valueForKey:@"name"] isEqualToString:@"task_aree"]) {
                    NSString *str = [[dic valueForKey:@"string"] stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
                    
                    [self setTextViewText:str];
                }
            }
        }
            break;
            
    }
}

- (void)setTextViewText:(NSString *)str
{
    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    self.textView.text = newStr;
}


//外部调用接口
-(void)parse{
    [self.par parse];
}



@end
