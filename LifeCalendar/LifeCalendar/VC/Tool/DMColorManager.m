//
//  DMColorManager.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMColorManager.h"

@implementation DMColorManager


+(UIColor*)colorOfCompare:(NSInteger)first with:(NSInteger)second{
    if (first == second) {
        return JDDarkOrange;
    }else{
        return first<second?Nav_Color:TextLightColor;
    }
}


+(UIColor *)colorWithYear:(NSInteger)year{
    NSInteger nowYear = [[NSDate date]year];
    return [self colorOfCompare:year with:nowYear];
}

+(UIColor *)colorWithMonth:(NSInteger)month{
    NSInteger nowMonth = [[NSDate date]month];
    return [self colorOfCompare:month with:nowMonth];
}

+(UIColor *)colorWithDay:(NSInteger)day{
    NSInteger nowDay = [[NSDate date]day];
    return [self colorOfCompare:day with:nowDay];
}

+(UIColor *)colorForDate:(NSDate *)date{
    NSInteger firtst = 1 , second = 1;
    
    if (![date isToday]) {
        NSDate *today = [NSDate date];
        if ([date isEarlierThan:today]) {
            firtst = 0;
        }else if ([date isLaterThan:today]){
            second = 0;
        }
    }
    
    return [self colorOfCompare:firtst with:second];
}

@end
