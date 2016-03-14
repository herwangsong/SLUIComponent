//
//  ViewController.m
//  SLCountDownButton
//
//  Created by alvin on 3/14/16.
//  Copyright © 2016 alvin. All rights reserved.
//

#import "ViewController.h"
#import "SLCountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SLCountDownButton *countDown = [[SLCountDownButton alloc]initWithFrame:CGRectMake(100, 300, 100, 35)];
    countDown.backgroundColor = [UIColor colorWithRed:1.0 green:0.2276 blue:0.1322 alpha:1.0];
    [countDown setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    // 注意循环引用 如果在这里面设置 button 的一些属性
    [countDown startWithSecond:5 touchUpInsideEvent:^(SLCountDownButton *countDownButton, NSUInteger tag) {
        
        
    } stepChange:^NSString *(SLCountDownButton *countDownButton, NSUInteger second) {
        
        return [NSString stringWithFormat:@"%ld秒",second];
        
    } countDownFinished:^NSString *(SLCountDownButton *countDownButton, NSUInteger second) {
        
        return [NSString stringWithFormat:@"获取验证码"];
    }];
    
    [self.view addSubview:countDown];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
