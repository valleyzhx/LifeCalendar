//
//  LifeYearView.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LifeYearViewDelegate <NSObject>

-(void)clickedMonth:(NSInteger)month year:(NSInteger)year;

@end


@interface LifeYearView : UIView

-(id)initWithYear:(NSInteger)year delegate:(id<LifeYearViewDelegate>)delegate;


@end
