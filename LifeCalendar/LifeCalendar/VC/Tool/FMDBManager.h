//
//  FMDBManager.h
//  MyDota
//
//  Created by Xiang on 15/10/26.
//  Copyright © 2015年 iOGG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMModel.h"


@interface FMDBManager : NSObject

+(id)shareManager;

-(NSArray*)queryTable:(Class)modelClass QueryString:(NSString *)sql;

-(BOOL)saveDataWithModel:(DMModel*)model;
-(BOOL)saveDataWithModelArray:(NSArray <DMModel*> *)modelList;

-(BOOL)deleteDataWithModel:(DMModel*)model;
-(BOOL)deleteDataWithModelArray:(NSArray <DMModel*> *)modelList;

-(BOOL)hasTheModel:(DMModel*)model;

@end
