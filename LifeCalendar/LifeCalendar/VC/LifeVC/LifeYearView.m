//
//  LifeYearView.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "LifeYearView.h"
#import "UserSetting.h"

#define kBtnWid 50

@implementation LifeYearView{
    NSInteger _year;
    UIView *_contentView;
    CGRect _orignFrame;
}


-(id)initWithYear:(NSInteger)year{
    if (self = [super init]) {
        _year = year;
        UIButton *btn = [[UIButton alloc]init];
        [btn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        _orignFrame = CGRectMake(0, 0, kBtnWid*4, kBtnWid*3);
        _contentView = [[UIView alloc]initWithFrame:_orignFrame];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:btn];
        [self addSubview:_contentView];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self initBtnsUI];
    }
    return self;
}


-(void)initBtnsUI{
    
    int month = 1;
    for (int j=0; j<3; j++) {
        for (int i=0; i<4; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*kBtnWid, j*kBtnWid, kBtnWid, kBtnWid)];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn  addTarget:self action:@selector(selectTheMonthAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:[NSString stringWithFormat:@"%d",month] forState:UIControlStateNormal];
            btn.transform = CGAffineTransformMakeScale(0.9, 0.9);
            btn.backgroundColor = [DMColorManager colorWithYear:_year];
            [_contentView addSubview:btn];
            month++;
        }
    }
}

-(void)showInView:(UIView*)view fromFram:(CGRect)rect{
    self.frame = view.bounds;
    [view addSubview:self];
    _contentView.frame = rect;
    _contentView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.frame = _orignFrame;
        _contentView.center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
        _contentView.alpha = 1;
    }];
}


#pragma mark- Actions

-(void)selectTheMonthAction:(UIButton*)btn{
    
}


-(void)closeAction:(UIButton*)btn{
    
}

@end
