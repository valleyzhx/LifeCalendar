//
//  LifeViewController.m
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "LifeViewController.h"
#import "ShowDatePickView.h"

@interface LifeViewController () <UIScrollViewDelegate>

@end

@implementation LifeViewController{
    UIButton *_addBirthBtn;
    UIScrollView *_scrollView;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self initUI];
}

-(void)initUI{
    NSDate *birth = [NSDateTool getBirthDay];
    if (birth) {
        [self loadLifeUI];
    }else{
        [self loadSetBirthdayUI];
    }
    
}


-(void)loadSetBirthdayUI{
    if (_addBirthBtn == nil) {
        _addBirthBtn = [[UIButton alloc]init];
        _addBirthBtn.backgroundColor = [UIColor blueColor];
        _addBirthBtn.layer.cornerRadius = 5;
        [_addBirthBtn addTarget:self action:@selector(clickAddBirthBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addBirthBtn];
        [_addBirthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    
    [self animatedShowView:_addBirthBtn hidenView:_scrollView];
}

-(void)loadLifeUI{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    [self animatedShowView:_scrollView hidenView:_addBirthBtn];

}


-(void)animatedShowView:(UIView*)showView hidenView:(UIView*)hidenView{
    showView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        showView.alpha = 1.0;
        hidenView.alpha = 0;
    } completion:^(BOOL finished) {
        hidenView.hidden = YES;
    }];
}

#pragma makr- action

-(void)clickAddBirthBtn:(UIButton*)btn{
    ShowDatePickView *picker = [ShowDatePickView viewWithFinishBlock:^(NSData *date) {
        
    }];
    [picker showInView:KeyWindow];
}






@end
