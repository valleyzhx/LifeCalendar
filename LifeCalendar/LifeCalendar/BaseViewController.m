//
//  BaseViewController.m
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = viewBGColor;
    
    if (_showTable) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        self.tableView.separatorColor = viewBGColor;
        self.tableView.backgroundColor = viewBGColor;
        self.tableView.showsVerticalScrollIndicator = NO;
        UIView *view =[ [UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [self.tableView setTableFooterView:view];
        
        [self.view addSubview:_tableView];
    }
    
}



-(void)showHudView{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideHudView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


#pragma mark- UITableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 10)];
    view.backgroundColor = viewBGColor;
    return view;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.textColor = TextDarkColor;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


@end
