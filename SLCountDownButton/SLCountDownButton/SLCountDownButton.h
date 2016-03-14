//
//  SLButton.h
//  HangXingHuJia
//
//  Created by alvin on 16/1/12.
//  Copyright © 2016年 alvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLCountDownButton;
typedef NSString* (^DidChangeBlock)(SLCountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^DidFinishedBlock)(SLCountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedDownBlock)(SLCountDownButton *countDownButton,NSUInteger tag);

@interface SLCountDownButton : UIButton

/**
 *
 *
 *  @param second               one loop total second number
 *  @param touchUpInsideHandler when button touch up inside event call block, you can do some button init in this block
 *  @param stepChangeHandler    every second repeat call block,you can do some specific setting for specific point-in time
 *  @param finishedHandler      finish call block,you can do some specific setting in this call block
 */
- (void)startWithSecond:(NSUInteger)second
     touchUpInsideEvent:(TouchedDownBlock)touchUpInsideHandler
              stepChange:(DidChangeBlock)stepChangeHandler
       countDownFinished:(DidFinishedBlock)finishedHandler;

/**
 *
 *
 *  @param title 
 */
- (void)stopWithTitle:(NSString *)title;
@end
