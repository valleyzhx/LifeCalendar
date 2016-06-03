//
//  LifeYearView.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "LifeYearView.h"
#import "UserSetting.h"

#define kBtnWid 40

@implementation LifeYearView{
    NSInteger _year;
    id<LifeYearViewDelegate> _delegate;
}


-(id)initWithYear:(NSInteger)year delegate:(id<LifeYearViewDelegate>)delegate{
    if (self = [self initWithFrame:CGRectMake(0, 0, kBtnWid*4, kBtnWid*3)]) {
        _year = year;
        [self initBtnsUI];
        _delegate = delegate;
    }
    return self;
}


-(void)initBtnsUI{
    NSInteger nowYear = [[NSDate date]year];
    int month = 1;
    for (int j=0; j<3; j++) {
        for (int i=0; i<4; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*kBtnWid, j*kBtnWid, kBtnWid, kBtnWid)];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn  addTarget:self action:@selector(selectTheMonthAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:[NSString stringWithFormat:@"%d",month] forState:UIControlStateNormal];
            btn.transform = CGAffineTransformMakeScale(0.9, 0.9);
            btn.backgroundColor = [DMColorManager colorWithYear:_year];
            if (_year == nowYear) {
                btn.backgroundColor = [DMColorManager colorWithMonth:month];
            }
            btn.tag = month;
            [self addSubview:btn];
            month++;
        }
    }
}


#pragma mark- Actions

-(void)selectTheMonthAction:(UIButton*)btn{
    if (_delegate && [_delegate respondsToSelector:@selector(clickedMonth:year:)]) {
        [_delegate clickedMonth:btn.tag year:_year];
    }
}


@end
