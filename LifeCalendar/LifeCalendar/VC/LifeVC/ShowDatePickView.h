//
//  ShowDatePickView.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/1.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDatePickView : UIView


+(id)viewWithFinishBlock:(void(^)(NSDate* date))complishBlock;
+(id)viewWithDateType:(UIDatePickerMode)mode finishBlock:(void(^)(NSDate* date))complishBlock;


-(void)showInView:(UIView*)view;
-(void)dismiss;

@end
