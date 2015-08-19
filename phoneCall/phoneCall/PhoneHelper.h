//
//  PhoneHelper.h
//  XiaoMa
//
//  Created by jt on 15-4-29.
//  Copyright (c) 2015年 jiangjunchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define gPhoneHelper  ([PhoneHelper sharedHelper])

typedef NS_ENUM(NSInteger, phoneCallType) {
    WithoutAlertAndBackCallType = 0,
    WithAlertAndBackCallType,
    WebViewCallType
};

@interface PhoneHelper : NSObject <UIAlertViewDelegate>

+ (PhoneHelper *)sharedHelper;

- (UIWebView *)makePhone:(NSString *)phoneNumber andType:(NSInteger)type andInfo:(NSString *)info;

@end
