//
//  DMShowContentView.m
//  LifeCalendar
//
//  Created by Xiang on 16/6/3.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "DMShowContentView.h"

@implementation DMShowContentView{
    UIButton *_backBtn;
    UIView *_contentView;
}

-(id)initWithContentView:(UIView*)contentView{
    if (self = [super init]) {
        _backBtn = [[UIButton alloc]init];
        _backBtn.backgroundColor = [UIColor blackColor];
        _backBtn.alpha = 0.4;
        [self addSubview:_backBtn];
        [_backBtn addTarget:self action:@selector(clickedBackgroundAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _contentView = contentView;
        [self addSubview:_contentView];
        CGSize r = _contentView.size;
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(r);
            make.center.equalTo(self);
        }];
    }
    return self;
}


-(void)setBackViewColor:(UIColor *)backViewColor{
    _backViewColor = backViewColor;
    _backBtn.backgroundColor = backViewColor;
}

-(void)showInView:(UIView *)view{
    self.frame = view.bounds;
    [view addSubview:self];
    _contentView.alpha = 0;
    _contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.alpha = 1;
        _contentView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

-(void)dissmiss{
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.alpha = 0;
        _contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)clickedBackgroundAction:(UIButton*)btn{
    [self dissmiss];
}

@end
