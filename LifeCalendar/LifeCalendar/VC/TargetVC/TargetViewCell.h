//
//  TargetViewCell.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/8.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *daysLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

+(id)initWithXib;

@end
