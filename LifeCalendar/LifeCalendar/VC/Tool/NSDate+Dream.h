//
//  NSDate+Dream.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+DateTools.h"

@interface NSDate (Dream)

-(NSDate*)setYear:(NSInteger)year;
-(NSDate*)setMonth:(NSInteger)month;
-(NSDate*)setDay:(NSInteger)day;

+(NSDate*)getToday;
+(NSDate*)getDateCompareToday:(NSInteger)days;

/**
 * Get  String
 *
 *
 *  @return
 */

+(NSString*)getDaysDescriptionFromToday:(NSTimeInterval)timestamp;

-(NSString*)dateString;
-(NSString*)timeString;
-(NSString*)dateAndTimeString;

@end
