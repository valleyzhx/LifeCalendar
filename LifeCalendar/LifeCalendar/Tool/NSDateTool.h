//
//  NSDateTool.h
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateTool : NSObject

+(void)saveBirthDay:(NSDate*)date;

+(NSDate*)getBirthDay;
@end
