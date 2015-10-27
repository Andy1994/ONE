//
//  aboutViewController.m
//  onedemo
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "aboutViewController.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#define ImageHight 200.0f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width/320
#define ScreenHeight [UIScreen mainScreen].bounds.size.height/568
@interface aboutViewController ()<UIWebViewDelegate>
{
    
    UIWebView *_webView;
}
@end

@implementation aboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320*ScreenWidth, 568*ScreenHeight)];
    
    [self creatWeb];
}

- (void)creatWeb{
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://m.wufazhuce.com/about?from=ONEApp" ];
    
    
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *jsString = [NSString stringWithFormat:@"var script = document.createElement('script');"
                          "script.type = 'text/javascript';"
                          "script.text = \"function ResizeImages() { "
                          "var myimg,oldwidth;"
                          "var maxwidth=%f;" //缩放系数
                          "for(i=0;i <document.images.length;i++){"
                          "myimg = document.images[i];"
                          "if(myimg.width > maxwidth){"
                          "oldwidth = myimg.width;"
                          "myimg.width = maxwidth;"
                          "myimg.height = myimg.height * (maxwidth/oldwidth);"
                          "}"
                          "}"
                          "}\";"
                          "document.getElementsByTagName('head')[0].appendChild(script);",ScreenWidth-15];
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
    
    [_webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
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
