//
//  ViewController.m
//  phoneCall
//
//  Created by 刘亚威 on 15/8/18.
//  Copyright (c) 2015年 lyw. All rights reserved.
//

#import "ViewController.h"
#import "PhoneHelper.h"

@interface ViewController ()
- (IBAction)phoneCallAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)phoneCallAction:(id)sender {
    UIButton * btn = sender;
    if (btn.tag == 0) {
        [gPhoneHelper makePhone:@"158****3784" andType:WithoutAlertAndBackCallType andInfo:@"这是有弹框的拨号协议，拨打电话时的弹框说明"];
    }
    else if (btn.tag == 1) {
        [gPhoneHelper makePhone:@"158****3784" andType:WithAlertAndBackCallType andInfo:@""];
    }
    else {
        [self.view addSubview:[gPhoneHelper makePhone:@"158****3784" andType:WebViewCallType andInfo:@""]];
    }
    
}
@end
