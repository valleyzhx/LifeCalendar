//
//  ShowDatePickView.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/1.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "ShowDatePickView.h"


@interface ShowDatePickView ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (copy, nonatomic) void (^myblock)(NSDate* date);
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end


@implementation ShowDatePickView{

}

+(id)viewWithFinishBlock:(void (^)(NSDate *))complishBlock{
    return [self viewWithDateType:UIDatePickerModeDate finishBlock:complishBlock];
}
+(id)viewWithDateType:(UIDatePickerMode)mode finishBlock:(void(^)(NSDate* date))complishBlock{
    ShowDatePickView *view = [[[NSBundle mainBundle]loadNibNamed:@"ShowDatePickView" owner:self options:nil]firstObject];
    view.myblock = complishBlock;
    view.datePicker.datePickerMode = mode;
//    view.datePicker.date = [NSDate dateWithTimeIntervalSince1970:946656000];//2000-1-1
    return view;
}


-(void)showInView:(UIView *)view{
    self.frame = view.bounds;
    [view addSubview:self];
    _contentView.top = self.height;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.bottom = self.height;
    }];
}

-(void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.top = self.height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (IBAction)backgroundClicked:(id)sender {
    [self dismiss];
}

- (IBAction)cancleAction:(id)sender {
    [self dismiss];

}
- (IBAction)doneAction:(id)sender {
    [self dismiss];
    if (_myblock) {
        _myblock(_datePicker.date);
    }

}



@end
