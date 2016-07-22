//
//  JDTextField.m
//  DaiDodgeKeyboard
//
//  Created by Xiang on 15/5/18.
//  Copyright (c) 2015年 ChilunChen. All rights reserved.
//

#import "JDTextField.h"

@interface JDTextField ()
@property (nonatomic,strong)NSString *cancelStringValue;

@end

@implementation JDTextField

-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startText:) name:UITextFieldTextDidBeginEditingNotification object:nil];
        self.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startText:) name:UITextFieldTextDidBeginEditingNotification object:nil];
        self.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return self;
}

-(void)setToobarView{
    UIToolbar *toolBar = [self createToolbar];
    self.inputAccessoryView = toolBar;
}

-(BOOL)becomeFirstResponder{
    if (self.inputAccessoryView == nil) {
        [self setToobarView];
    }
    return [super becomeFirstResponder];
}

-(UIToolbar*) createToolbar {
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(cancelTextField)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"完成"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(textFieldDone)];
    toolBar.items = @[cancelButton, space, done];
    
    return toolBar;
    
}


-(void)startText:(NSNotificationCenter*)notification{
    self.cancelStringValue = self.text;
}



-(void)cancelTextField{
    self.text = self.cancelStringValue;
    [self resignFirstResponder];
}

-(void) textFieldDone {
    [self resignFirstResponder];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
