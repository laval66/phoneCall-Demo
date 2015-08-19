//
//  PhoneHelper.m
//  XiaoMa
//
//  Created by jt on 15-4-29.
//  Copyright (c) 2015年 jiangjunchen. All rights reserved.
//

#import "PhoneHelper.h"

@interface PhoneHelper()

@property (nonatomic, copy) NSString * phoneNumber;

@end

@implementation PhoneHelper

+ (PhoneHelper *)sharedHelper
{
    static dispatch_once_t onceToken;
    static PhoneHelper *g_phoneHelper;
    dispatch_once(&onceToken, ^{
        g_phoneHelper = [[PhoneHelper alloc] init];
    });
    return g_phoneHelper;
}

- (UIWebView *)makePhone:(NSString *)phoneNumber andType:(NSInteger)type andInfo:(NSString *)info
{
    _phoneNumber = phoneNumber;
    
    if (type == WithoutAlertAndBackCallType) {
        UIAlertView * av = [[UIAlertView alloc] initWithTitle:nil message:info delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"拨打", nil];
        av.delegate = self;
        [av show];
        return nil;
    }
    else if (type == WithAlertAndBackCallType) {
        //此种协议会弹出内容为电话号码的系统自带弹框，结束后会返回app
        NSString * urlStr = [NSString stringWithFormat:@"telprompt://%@",_phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        return nil;
    }
    else {
        //此种使用webview的协议，需要add到view中,效果同telprompt协议
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_phoneNumber];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        return callWebview;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //此种协议会直接跳转至拨号盘但是iOS7以下版本无法返回原app
        NSString * urlStr = [NSString stringWithFormat:@"tel://%@",_phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    }
}


@end
