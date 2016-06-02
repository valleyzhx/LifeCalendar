//
//  UserSetting.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "UserSetting.h"

@implementation UserSetting

+(id)sharedUserSetting{
    static dispatch_once_t onceToken;
    static UserSetting *_sharedSetting;
    dispatch_once(&onceToken, ^{
        _sharedSetting = [UserSetting getModelFromDB];
    });
    return _sharedSetting;
}


-(instancetype)init{
    if (self = [super init]) {
        _wholeYear = 80;
        self.modelID = 1;
    }
    return self;
}

@end
