//
//  DMColorManager.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMColorManager : NSObject

+(UIColor*)colorWithYear:(NSInteger)year;
+(UIColor*)colorWithMonth:(NSInteger)month; // year is same 
+(UIColor*)colorWithDay:(NSInteger)day; // year and mont both same

+(UIColor*)colorForDate:(NSDate*)date;
@end
