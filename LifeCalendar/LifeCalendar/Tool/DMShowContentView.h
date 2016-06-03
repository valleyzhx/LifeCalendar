//
//  DMShowContentView.h
//  LifeCalendar
//
//  Created by Xiang on 16/6/3.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMShowContentView : UIView

@property (nonatomic, strong) UIColor *backViewColor;


-(id)initWithContentView:(UIView*)contentView;

-(void)showInView:(UIView*)view;
-(void)dissmiss;

@end
