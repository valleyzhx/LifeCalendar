//
//  DMTarget.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/3.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMModel.h"

@interface DMTarget : DMModel

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *note;

@property (nonatomic, assign) double timeStamp;

@property (nonatomic, assign) double fireStamp;

@end
