//
//  DMColorManager.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMColorManager.h"

@implementation DMColorManager


+(UIColor *)colorWithYear:(NSInteger)year{
    NSInteger nowYear = [[NSDate date]year];
    if (year == nowYear) {
        return JDDarkOrange;
    }else{
        return year<nowYear?Nav_Color:TextLightColor;
    }
}


@end
