//
//  DMModel+FMDB.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMModel+FMDB.h"
#import "FMDBManager.h"

@implementation DMModel (FMDB)

+(id)getModelFromDB{
    NSString *sql = [NSString stringWithFormat:@"Select * From (%@) where modelID = 1",NSStringFromClass([self class])];
    NSArray* arr = [[FMDBManager shareManager]queryTable:[self class] QueryString:sql];
    if (arr.count) {
        return arr[0];
    }
    return [[self alloc]init];
}

+(NSArray*)getModelArrayFromDB{
    return [self getModelArrayFromDBWithCondition:nil];
}

+(NSArray *)getModelArrayFromDBWithCondition:(NSString *)condition{
    NSString *sql = [NSString stringWithFormat:@"Select * From (%@) ",NSStringFromClass([self class])];
    if (condition) {
        sql = [sql stringByAppendingString:condition];
    }
    return [[FMDBManager shareManager]queryTable:[self class] QueryString:sql];
}

@end
