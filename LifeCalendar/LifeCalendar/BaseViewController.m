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
        _tableView = [[UITableView alloc]init];
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
    _naviBar = [self setUpNaviViewWithType:_navType];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_naviBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

-(GGNavigationBar *)setUpNaviViewWithType:(GGNavigationBarType)type{
    if (_naviBar) {
        [_naviBar removeFromSuperview];
        _naviBar = nil;
    }
    if (type == GGNavigationBarTypeNone) {
        return nil;
    }
    
    GGNavigationBar *view = [[GGNavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.title = self.title;
    view.backgroundView.backgroundColor = Nav_Color;
    view.backgroundView.alpha = 1;
    
    if (type == GGNavigationBarTypeNormal) {
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        [backBtn setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(clickedBackAction:) forControlEvents:UIControlEventTouchUpInside];
        view.leftView = backBtn;
    }
    
    [self.view addSubview:view];
    return view;
}

-(void)clickedBackAction:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
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
