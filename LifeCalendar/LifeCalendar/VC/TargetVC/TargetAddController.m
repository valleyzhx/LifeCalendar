//
//  TargetAddController.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "TargetAddController.h"
#import "ShowDatePickView.h"


@interface TargetAddController () <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation TargetAddController{
    UIButton *_saveBtn;
    JDTextView *_textView;
    JDTextField *_field;
}

- (void)viewDidLoad {
    self.showTable = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, SCREEN_WIDTH-2*10, 50)];
    _saveBtn.backgroundColor = JDDarkOrange;
    [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [_saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_saveBtn addTarget:self action:@selector(saveTargetAction:) forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
    [view addSubview:_saveBtn];
    self.tableView.tableFooterView = view;
    _saveBtn.layer.cornerRadius = 5;
    if (!_targetModel) {
        _targetModel = [DMTarget new];
    }
}

-(void)clickedBackAction:(UIButton*)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    
    float orgX = 80;
    if (indexPath.row == 3) {//备注
        _textView = [[JDTextView alloc]initWithFrame:CGRectMake(orgX, 5, SCREEN_WIDTH-orgX-10, 50)];
        _textView.delegate = self;
        [cell.contentView addSubview:_textView];
        _textView.text = _targetModel.note;
    }else if(indexPath.row == 0){
        _field = [[JDTextField alloc]initWithFrame:CGRectMake(orgX, 5, SCREEN_WIDTH-orgX-10, 30)];
        _field.delegate = self;
        [cell.contentView addSubview:_field];
        _field.text = _targetModel.title;
    }else{
        UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(orgX, 5, 120, 30)];
        contentLab.textColor = TextDarkColor;
        contentLab.font = [UIFont systemFontOfSize:12];
        contentLab.tag = 10;
        [cell.contentView addSubview:contentLab];
        
        if (indexPath.row == 1) {
            contentLab.text = _targetModel.timeStamp?[[NSDate dateWithTimeIntervalSince1970:_targetModel.timeStamp]dateString]:@"";
        }else{
            contentLab.text = _targetModel.fireTimeStr?:@"不提醒";
        }
    }
    NSArray *arr = @[@"标题",@"日期",@"提醒",@"备注"];
    cell.textLabel.text = arr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        ShowDatePickView *picker = [ShowDatePickView viewWithFinishBlock:^(NSDate *date) {
            _targetModel.timeStamp = date.timeIntervalSince1970;
            [self refreshUI:indexPath];
        }];
        [self.view endEditing:YES];
        [picker showInView:KeyWindow];
    }
    if (indexPath.row == 2) {
        ShowDatePickView *picker = [ShowDatePickView viewWithDateType:UIDatePickerModeTime finishBlock:^(NSDate *date) {
            _targetModel.fireTimeStr = [date timeString];
            [self refreshUI:indexPath];
        }];
        [self.view endEditing:YES];
        [picker showInView:KeyWindow];
    }
}


-(void)refreshUI:(NSIndexPath*)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 1) {
        UILabel *contentLab = [cell.contentView viewWithTag:10];
        contentLab.text = [[NSDate dateWithTimeIntervalSince1970:_targetModel.timeStamp]dateString];
    }
    if (indexPath.row == 2) {
        UILabel *contentLab = [cell.contentView viewWithTag:10];
        contentLab.text = _targetModel.fireTimeStr;
    }
    
}


#pragma mark- actions
-(void)saveTargetAction:(UIButton*)btn{
    if (!_field.text.length) {
        [self showMessage:@"请输入标题"];
        return;
    }
    if (!_targetModel.timeStamp) {
        [self showMessage:@"请选择日期"];
        return;
    }
    
    _targetModel.title = _field.text;
    _targetModel.note = _textView.text;
    [[FMDBManager shareManager]saveDataWithModel:_targetModel];
    if (_delegate&&[_delegate respondsToSelector:@selector(targetAddDone)]) {
        [_delegate targetAddDone];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
