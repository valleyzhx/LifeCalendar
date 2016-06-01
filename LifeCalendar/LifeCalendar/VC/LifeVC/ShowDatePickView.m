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
@property (copy, nonatomic) void (^myblock)(NSData* date);
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end


@implementation ShowDatePickView{

}

+(id)viewWithFinishBlock:(void (^)(NSData *))complishBlock{
    ShowDatePickView *view = [[[NSBundle mainBundle]loadNibNamed:@"ShowDatePickView" owner:self options:nil]firstObject];
    view.myblock = complishBlock;
    view.datePicker.datePickerMode = UIDatePickerModeDate;
    view.datePicker.date = [NSDate dateWithTimeIntervalSince1970:946656000];//2000-1-1
    return view;
}


-(void)showInView:(UIView *)view{
    self.frame = view.bounds;
    [view addSubview:self];
    _contentView.top = self.height;
    [UIView animateWithDuration:1 animations:^{
        _contentView.bottom = 0;
    }];
}

-(void)dismiss{
    [UIView animateWithDuration:1 animations:^{
        _contentView.top = self.height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (IBAction)backgroundClicked:(id)sender {
    [self dismiss];
}
@end
