//
//  UserSetting.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMModel.h"

@interface UserSetting : DMModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double birthDay;
@property (nonatomic, assign) int wholeYear;

+(id)sharedUserSetting;


@end
