//
//  TargetAddController.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "BaseViewController.h"
#import "DMTarget.h"


@protocol TargetAddControllerDelegate <NSObject>

-(void)targetAddDone;

@end

@interface TargetAddController : BaseViewController

@property (nonatomic,copy)DMTarget *targetModel;
@property (nonatomic,assign) id <TargetAddControllerDelegate> delegate;
@end
