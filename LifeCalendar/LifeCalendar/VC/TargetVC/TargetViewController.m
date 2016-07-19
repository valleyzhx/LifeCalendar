//
//  TargetViewController.m
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "TargetViewController.h"
#import "DMTarget.h"
#import "TargetViewCell.h"

#import "TargetAddController.h"

@implementation TargetViewController{
    NSMutableArray *_dataArr;
}

-(void)viewDidLoad{
    self.showTable = YES;
    [super viewDidLoad];
    
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    self.tableView.tableFooterView = footer;
    UIButton *addBtn = [[UIButton alloc]init];
    addBtn.backgroundColor = Nav_Color;
    [self.view addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-5);
        make.width.height.mas_equalTo(40);
    }];
    
    [addBtn addTarget:self action:@selector(addTargetModelAction:) forControlEvents:UIControlEventTouchUpInside];

    [self reLoadListData];
    
}

-(void)reLoadListData{
//   NSArray * allArr = [DMTarget getModelArrayFromDBWithCondition:@"ORDER BY timeStamp"];
    NSMutableArray *firstArr = [NSMutableArray array];
    NSMutableArray *secondArr = [NSMutableArray array];
    
    
    NSTimeInterval time = [[NSDate getToday]timeIntervalSince1970];
    NSMutableArray *allArr = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        DMTarget *target = [[DMTarget alloc]init];
        target.timeStamp = time + (i-5)*(3600*24);
        target.content = @"于是他默默追逐着，横渡海峡，年轻的人，看着他们，为了彼岸，骄傲的，骄傲的灭亡~";
        [allArr addObject:target];
    }
    
    for (DMTarget *model in allArr) {
        if (model.timeStamp < time) {
            [firstArr addObject:model];
        }else{
            [secondArr addObject:model];
        }
    }
    
   _dataArr =[NSMutableArray arrayWithArray:@[firstArr,secondArr]];
    [self.tableView reloadData];
}



#pragma mark- UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _dataArr[section];
    return arr.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TargetViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TargetCell"];
    if (!cell) {
        cell = [TargetViewCell initWithXib];
    }
    DMTarget *model = _dataArr[indexPath.section][indexPath.row];
    
    cell.titleLab.text = model.content;
    cell.daysLab.text = [NSDate getDaysDescriptionFromToday:model.timeStamp];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark- action
-(void)addTargetModelAction:(UIButton*)btn{
    TargetAddController *vc = [[TargetAddController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
