//
//  LifeView.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/2.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "LifeView.h"
#import "UserSetting.h"
#import "LifeYearView.h"

#define kColumn 8
#define kBtnWid (SCREEN_WIDTH/kColumn)

@interface LifeView () <UIScrollViewDelegate,PopoverViewDelegate,LifeYearViewDelegate,PDTSimpleCalendarViewDelegate>

@end

@implementation LifeView{
    UIScrollView *_scrollView;
    PopoverView *_popView;
    PDTSimpleCalendarViewController *_dateRangeCalendarViewController;
}

+(id)lifeView{
    LifeView *view = [[LifeView alloc]init];
    return view;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return self;
}



-(void)reloadView{
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    UserSetting *set = [UserSetting sharedUserSetting];
    int row = set.wholeYear/kColumn;
    
    NSInteger startYear = [[NSDate dateWithTimeIntervalSince1970:set.birthDay]year];
    NSInteger nowYear = [[NSDate date]year];

    for (int i=0; i<row; i++) {
        for (int j=0; j<kColumn; j++) {
            UIButton *btn = [self getItemViewWithFrame:CGRectMake(j*kBtnWid, i*kBtnWid, kBtnWid, kBtnWid) year:startYear now:nowYear];
            [_scrollView addSubview:btn];
            startYear++;
       }
    }
    
    int extraCount = set.wholeYear%kColumn;
    for (int i=0; i<extraCount; i++) {
        UIButton *btn = [self getItemViewWithFrame:CGRectMake(i*kBtnWid, row*kBtnWid, kBtnWid, kBtnWid) year:startYear now:nowYear];
        [_scrollView addSubview:btn];
        startYear++;
    }
    if (extraCount) {
        row++;
    }
    
    _scrollView.contentSize = CGSizeMake(self.width, row*kBtnWid);
    
}

-(UIButton*)getItemViewWithFrame:(CGRect)frame year:(NSInteger)year now:(NSInteger)nowYear{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn  addTarget:self action:@selector(clickedNowYearBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitle:[NSString stringWithFormat:@"%ld",year] forState:UIControlStateNormal];
    btn.tag = year;
    btn.backgroundColor = [DMColorManager colorWithYear:year];
    btn.transform = CGAffineTransformMakeScale(0.95, 0.95);
    return btn;
}

#pragma mark- action

-(void)clickedNowYearBtn:(UIButton*)btn{
   LifeYearView *view = [[LifeYearView alloc]initWithYear:btn.tag delegate:self];
    
    CGPoint point = [self convertPoint:btn.center fromView:_scrollView];
    NSString *title = [[btn titleForState:UIControlStateNormal]stringByAppendingString:@"年"];
    _popView = [PopoverView showPopoverAtPoint:point inView:self withTitle:title withContentView:view delegate:self];
    
}


#pragma mark- PopoverViewDelegate

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index{
    
}

#pragma mark- LifeYearViewDelegate

-(void)clickedMonth:(NSInteger)month year:(NSInteger)year{
    [_popView dismiss];
    
    _dateRangeCalendarViewController = [[PDTSimpleCalendarViewController alloc] init];
    _dateRangeCalendarViewController.backgroundColor = viewBGColor;
    NSDate *date = [NSDate dateWithYear:year month:month day:1];
    _dateRangeCalendarViewController.firstDate = date;
    
    _dateRangeCalendarViewController.lastDate = [date dateByAddingDays:[date daysInMonth]-1];
    
    _dateRangeCalendarViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 350);
    _dateRangeCalendarViewController.delegate = self;
    UIColor *color = [DMColorManager colorWithYear:year];
    NSDate *today = [NSDate date];
    if (today.year == year) {
        color = [DMColorManager colorWithMonth:month];
//        if (today.month == month) {
//            color = [DMColorManager colorWithDay:]
//        }
    }
    [[PDTSimpleCalendarViewCell appearance] setCircleDefaultColor:viewBGColor];
    [[PDTSimpleCalendarViewCell appearance] setCircleTodayColor:[UIColor clearColor]];
    [[PDTSimpleCalendarViewCell appearance] setCircleSelectedColor:JDRedColor];
    
    DMShowContentView *showView = [[DMShowContentView alloc]initWithContentView:_dateRangeCalendarViewController.view];
    [showView showInView:self];
    
}


#pragma mark- PDTSimpleCalendarViewDelegate
- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date{
    
}
- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller shouldUseCustomColorsForDate:(NSDate *)date{
    return YES;
}
- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller textColorForDate:(NSDate *)date{
    return [DMColorManager colorForDate:date];
}

@end
