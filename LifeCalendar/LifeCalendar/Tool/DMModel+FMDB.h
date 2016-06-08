//
//  DMModel+FMDB.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMModel.h"

@interface DMModel (FMDB)


+(id)getModelFromDB;

+(NSArray*)getModelArrayFromDB;

+(NSArray*)getModelArrayFromDBWithCondition:(NSString*)condition;

@end
