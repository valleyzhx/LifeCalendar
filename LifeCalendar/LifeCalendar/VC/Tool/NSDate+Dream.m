//
//  NSDate+Dream.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "NSDate+Dream.h"

@implementation NSDate (Dream)


+(NSDate *)getToday{
    NSDate *date = [NSDate date];
    return [NSDate dateWithYear:date.year month:date.month day:date.day];
}

+(NSDate *)getDateCompareToday:(NSInteger)days{
    NSDate *today = [self getToday];
    if (days>=0) {
        return [today dateByAddingDays:days];
    }else{
        return [today dateBySubtractingDays:-days];
    }
}

-(NSDate*)setYear:(NSInteger)year{
    return [NSDate dateWithYear:year month:self.month day:self.day];
}
-(NSDate*)setMonth:(NSInteger)month{
    return [NSDate dateWithYear:self.year month:month day:self.day];
    
}
-(NSDate*)setDay:(NSInteger)day{
    return [NSDate dateWithYear:self.year month:self.month day:day];
}

+(NSString *)getDaysDescriptionFromToday:(NSTimeInterval )timestamp{
    NSTimeInterval today = [[self getToday]timeIntervalSince1970];
    double result = (timestamp-today)/(24*3600);
    if (result<-2) {
        return [NSString stringWithFormat:@"%d天前",(int)ceil(ABS(result))-1];
        
    }else if (result<-1){
        return @"前天";
    }else if (result<0){
        return @"昨天";
    }else if (result<1){
        return @"今天";
    }else if (result<2){
        return @"明天";
    }else if (result<3){
        return @"后天";
    }
    else{
        return [NSString stringWithFormat:@"%d天后",(int)ceil(ABS(result))-1];
    }
}




-(NSString *)dateString{
   return [self formattedDateWithFormat:@"yyyy-MM-dd"];
}

-(NSString *)timeString{
    return [self formattedDateWithFormat:@"HH:mm"];
}
-(NSString *)dateAndTimeString{
    return [self formattedDateWithFormat:@"yyyy-MM-dd HH:mm"];

}






@end
