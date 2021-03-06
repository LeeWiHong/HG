//
//  HGNetworkUtils.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGNetworkUtils.h"


@implementation HGNetworkUtils

- (void)ConnectWithMeThod:(HGMethodType)MethodType Url:(NSString *)UrlString Parameters:(id)Parameters Success:(SuccessBlock)SuccessBlock Failure:(FailureBlock)FailureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", @"text/plain",nil];
    manager.requestSerializer.timeoutInterval = 30;
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    if (MethodType == GET)
    {
        [manager GET:[HostUrl stringByAppendingString:UrlString] parameters:Parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *data = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves error:nil];
            SuccessBlock(data);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            FailureBlock(error);
        }];
    }else if (MethodType == POST)
    {
        [manager POST:[HostUrl stringByAppendingString:UrlString] parameters:Parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *data = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves error:nil];
            SuccessBlock(data);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            FailureBlock(error);
        }];
    }
}

#pragma mark - 删除cookie

- (void)DeleteCookie
{
    NSLog(@"============删除cookie===============");
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    //删除cookie
    for (NSHTTPCookie *tempCookie in cookies) {
        [cookieStorage deleteCookie:tempCookie];
    }
    //把cookie打印出来，检测是否已经删除
    NSArray *cookiesAfterDelete = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *tempCookie in cookiesAfterDelete) {
        NSLog(@"cookieAfterDelete: %@", tempCookie);
    }
    NSLog(@"\n");
}



-(void)printReuest:(NSString *)url params:(NSDictionary *)param {
    
    NSMutableString *printstr = [NSMutableString stringWithFormat:@"%@",url];
    if (param) {
        NSEnumerator *keys = [param keyEnumerator];
        for (NSString *key in keys) {
            id value = [param objectForKey:key];
            [printstr appendFormat:@"?%@=%@",key,value];
        }
    }
    NSLog(@"request :%@",printstr);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error

{
    
    //一个页面没有被完全加载之前收到下一个请求，此时迅速会出现此error,error=-999
    
    //此时可能已经加载完成，则忽略此error，继续进行加载。
    
    //http://stackoverflow.com/questions/1024748/how-do-i-fix-nsurlerrordomain-error-999-in-iphone-3-0-os
    
    if([error code] == NSURLErrorCancelled)
        
    {
        
        return;
        
    }
    
}

@end
