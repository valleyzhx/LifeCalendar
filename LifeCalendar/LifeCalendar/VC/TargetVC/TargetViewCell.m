//
//  TargetViewCell.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "TargetViewCell.h"

@implementation TargetViewCell

+(id)initWithXib{
    TargetViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"TargetViewCell" owner:self options:nil]firstObject];
    return cell;
}


-(void)awakeFromNib{
    _daysLab.layer.cornerRadius = 25;
    _daysLab.layer.masksToBounds = YES;
    _daysLab.backgroundColor = Nav_Color;
    _titleLab.textColor = TextDarkColor;

}

@end
