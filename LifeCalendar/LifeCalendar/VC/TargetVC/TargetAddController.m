//
//  TargetAddController.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "TargetAddController.h"

#define orgX 40

@interface TargetAddController () <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation TargetAddController{
    
}

- (void)viewDidLoad {
    self.showTable = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;//名字，到期日，提醒，备注
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 60;
    }
    return 40;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 3) {//备注
        JDTextView *textView = [[JDTextView alloc]initWithFrame:CGRectMake(orgX, 5, SCREEN_WIDTH-orgX-10, 50)];
        textView.delegate = self;
        [cell.contentView addSubview:textView];
    }else{
        JDTextField *field = [[JDTextField alloc]initWithFrame:CGRectMake(orgX, 5, SCREEN_WIDTH-orgX-10, 30)];
        field.delegate = self;
        [cell.contentView addSubview:field];
    }
    NSArray *arr = @[@"名字",@"到期日",@"提醒",@"备注"];
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}


@end
