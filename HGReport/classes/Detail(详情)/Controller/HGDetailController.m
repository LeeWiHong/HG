//
//  HGDetailController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/6/18.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGDetailController.h"
#import <MMMarkdown/MMMarkdown.h>

@interface HGDetailController ()

@end

@implementation HGDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *markdown = @"~~Mistaken~~";
    NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:markdown extensions:MMMarkdownExtensionsGitHubFlavored error:NULL];
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:HGFrame];
    [webview loadHTMLString:htmlString baseURL:nil];
    [self.view addSubview:webview];
}



@end
