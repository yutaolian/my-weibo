//
//  OAuthController.m
//  my-weibo
//
//  Created by lyt on 15/3/21.
//  Copyright (c) 2015年 lyt. All rights reserved.
//

#import "OAuthController.h"
#import "confg.h"
#import "AFNetworking.h"

@interface OAuthController ()
{
    UIWebView *_webView;
}

@end

@implementation OAuthController

//因为这个控制器只有一个view，在loadView加载时初化即可，
-(void)loadView
{
   // _webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, 320, 568)];

    
    self.view = _webView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.加载登陆界面
    
    NSString *urlStr = [kAuthorize stringByAppendingFormat:@"?display=mobile&client_id=%@&redirect_uri=%@",kAppKey,kRedirectUri];
    //NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2241498534&redirect_uri=http://weibo.com/u/2449318213/home?wvr=5&display=mobile"];
    
    NSURL *url = [NSURL URLWithString:urlStr ];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    //2.设置webview 的监听（代理）方法。
    
    _webView.delegate = self;
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL);
    //获取url的全路径
    NSString *urlStr = request.URL.absoluteString;
    //获取code＝的位置
    NSRange rang = [urlStr rangeOfString:@"code="];
    
    if (rang.length != 0) {
        
        NSInteger index = rang.location + rang.length;
        //截code的值
        NSString *code = [urlStr substringFromIndex:index];

        NSLog(@"code ---- %@",code);
        
        NSString *accessStr = @"https://api.weibo.com/oauth2/access_token";
        
        NSURL *accessUrl = [NSURL URLWithString:accessStr];
        
        NSMutableURLRequest *post = [NSMutableURLRequest requestWithURL:accessUrl];
        
        post.HTTPMethod = @"POST";
        
        NSString *params = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=authorization_code&code=%@&redirect_uri=%@",kAppKey,kAppSecret,code,kRedirectUri];
        
        post.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
        
        
//        AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:accessUrl];
//        
//        NSURLRequest *post = [client requestWithMethod:@"POST" path:nil parameters:@{
//
//                                                                @"client_id" : kAppKey,
//                                                                @"client_secret" : kAppSecret,
//                                                                @"grant_type" :	 @"authorization_code",
//                                                                @"code": code,
//                                                                @"redirect_uri": kRedirectUri
//                                                                }];
        
     
        NSOperation *operation =  [AFJSONRequestOperation JSONRequestOperationWithRequest:post success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSLog(@"succcess--json %@",JSON);
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            
            NSLog(@"failure--json %@,%@",JSON,[error localizedDescription]);
        }];
        
        
        [operation start];
        
        
        return NO;
        
    }
    return YES;
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
