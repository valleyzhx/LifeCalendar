//
//  LifeViewController.m
//  LifeCalendar
//
//  Created by Xiang on 16/5/31.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "LifeViewController.h"
#import "ShowDatePickView.h"
#import "UserSetting.h"
#import "LifeView.h"

@interface LifeViewController () <UIScrollViewDelegate>
@property (nonatomic,strong) UserSetting *userSetting;

@end

@implementation LifeViewController{
    UIButton *_addBirthBtn;
    LifeView *_lifeView;
    UserSetting *_userSetting;
}


-(void)viewDidLoad{
    self.navType = GGNavigationBarTypeCustom;
    [super viewDidLoad];
    _userSetting = [UserSetting sharedUserSetting];
    [self reloadUI];
}



-(void)reloadUI{
    if (_userSetting.birthDay) {
        [self loadLifeUI];
    }else{
        [self loadSetBirthdayUI];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


-(void)loadSetBirthdayUI{
    if (_addBirthBtn == nil) {
        _addBirthBtn = [[UIButton alloc]init];
        _addBirthBtn.backgroundColor = Nav_Color;
        _addBirthBtn.layer.cornerRadius = 5;
        [_addBirthBtn addTarget:self action:@selector(clickAddBirthBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addBirthBtn];
        [_addBirthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.view);
            make.height.mas_equalTo(60);
        }];
    }
    
    [self animatedShowView:_addBirthBtn hidenView:_lifeView];
}

-(void)loadLifeUI{
    if (!_lifeView) {
        _lifeView = [LifeView lifeView];
        [self.view addSubview:_lifeView];
        [_lifeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_naviBar.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }
    [_lifeView reloadView];
    [self animatedShowView:_lifeView hidenView:_addBirthBtn];

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
    ShowDatePickView *picker = [ShowDatePickView viewWithFinishBlock:^(NSDate *date) {
        _userSetting.birthDay = [date timeIntervalSince1970];
        [self reloadUI];
        [[FMDBManager shareManager]saveDataWithModel:_userSetting];
    }];
    [picker showInView:KeyWindow];
}






@end
