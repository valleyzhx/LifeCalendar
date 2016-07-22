//
//  BaseViewController.h
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGNavigationBar.h"


@interface BaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    GGNavigationBar *_naviBar;

}

@property (nonatomic,assign) GGNavigationBarType navType;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) BOOL showTable;


-(void)showHudView;
-(void)hideHudView;

-(void)showMessage:(NSString*)message;

@end
