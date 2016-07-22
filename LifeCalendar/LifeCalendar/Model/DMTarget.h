//
//  DMTarget.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/3.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMModel.h"

@interface DMTarget : DMModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *note;

@property (nonatomic, assign) double timeStamp;

@property (nonatomic, strong) NSString *fireTimeStr;


@end
