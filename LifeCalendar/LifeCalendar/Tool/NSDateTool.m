//
//  NSDateTool.m
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "NSDateTool.h"

#define kBirthday @"lifeBirthDay"

@implementation NSDateTool

+(void)saveBirthDay:(NSDate *)date{
    [[NSUserDefaults standardUserDefaults]setObject:date forKey:kBirthday];
}

+(NSDate *)getBirthDay{
    return [[NSUserDefaults standardUserDefaults]objectForKey:kBirthday];
}




@end
