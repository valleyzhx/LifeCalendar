//
//  BaseViewController.h
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) BOOL showTable;


@end
