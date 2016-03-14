//
//  SLButton.m
//  HangXingHuJia
//
//  Created by alvin on 16/1/12.
//  Copyright © 2016年 alvin. All rights reserved.
//

#import "SLCountDownButton.h"

@interface SLCountDownButton ()

{
    NSString * _startTitle;
    NSUInteger _second;
    NSUInteger _totalSecond;
    
    NSTimer *_timer;
    
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}

@end

@implementation SLCountDownButton

- (void)startWithSecond:(NSUInteger)second touchUpInsideEvent:(TouchedDownBlock)touchUpInsideHandler stepChange:(DidChangeBlock)stepChangeHandler countDownFinished:(DidFinishedBlock)finishedHandler{
    _startTitle = self.titleLabel.text;
    _totalSecond = second;
    _touchedDownBlock = [touchUpInsideHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
    _didChangeBlock = [stepChangeHandler copy];
    _didFinishedBlock = [finishedHandler copy];
}


-(void)touched:(SLCountDownButton*)sender{
    if (_touchedDownBlock) {
        _touchedDownBlock(sender,sender.tag);
        
        [self startWithSecond:_totalSecond];
    }
    
    
}

-(void)startWithSecond:(NSUInteger)totalSecond
{
    self.enabled = NO;
    _second = totalSecond;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)timerStart:(NSTimer *)theTimer {
    
    _second--;
    
    NSLog(@"%ld",_second);
    if (_second <= 0)
    {
        [self stopWithTitle:_startTitle];
    }
    else
    {
        //        _second--;
        if (_didChangeBlock)
        {
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateNormal];
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateDisabled];
            
        }
        else
        {
             NSString *title = [NSString stringWithFormat:@"%ld秒",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }
}

- (void)stopWithTitle:(NSString *)title{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock)
                {
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateNormal];
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateDisabled];
                    
                }
                else
                {
                    [self setTitle:title forState:UIControlStateNormal];
                    [self setTitle:title forState:UIControlStateDisabled];
                    
                }
            }
        }
    }
    
    self.enabled = YES;
}

@end
