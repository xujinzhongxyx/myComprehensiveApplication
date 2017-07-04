//
//  findView.m
//  myComprehensiveApplication
//
//  Created by jinzhong xu on 2017/6/22.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "LSFindView.h"

@implementation LSFindView

-(instancetype) init
{
    if (self=[super init]) {
        self.backgroundColor = [UIColor yellowColor];
        [self loadSubViews];
    }
    
    return self;
}

-(void)loadSubViews
{
    UITextField *textField = [[UITextField alloc] init];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.width.equalTo(self).offset(-30);
        make.height.offset(50);
        make.centerX.equalTo(self);
    }];
    
    UIButton *btnColor = [[UIButton alloc] init];
    btnColor.layer.backgroundColor = [UIColor blueColor].CGColor;
    btnColor.layer.cornerRadius = 5.0f;
    [btnColor setTitle:@"color" forState:UIControlStateNormal];
    [btnColor setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[btnColor rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //[_subjectColor sendNext:nil];
        [_commandColor execute:nil];
        textField.textColor = [UIColor redColor];
    }];
    [self addSubview:btnColor];
    
    [btnColor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(20);
        make.left.equalTo(textField);
        make.width.offset(100);
        make.height.offset(50);
    }];
    
    UIButton *btnclean = [[UIButton alloc] init];
    btnclean.layer.backgroundColor = [UIColor blueColor].CGColor;
    btnclean.layer.cornerRadius = 5.0f;
    [btnclean setTitle:@"clean" forState:UIControlStateNormal];
    [btnclean setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[btnclean rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //[_subjectClean sendNext:nil];
        [_commandClean execute:nil];
        textField.textColor = [UIColor blackColor];
    }];
    [self addSubview:btnclean];
    
    [btnclean mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(20);
        make.right.equalTo(textField);
        make.width.offset(100);
        make.height.offset(50);
    }];
}

-(RACSubject *)subjectColor
{
    if (!_subjectColor) {
        _subjectColor = [RACSubject subject];
    }
    
    return _subjectColor;
}

-(RACSubject *)subjectClean
{
    if (!_subjectClean) {
        _subjectClean = [RACSubject subject];
    }
    
    return _subjectClean;
}

-(RACCommand *)commandColor
{
    if (!_commandColor) {
        _commandColor = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return _commandColor;
}

-(RACCommand *)commandClean
{
    if (!_commandClean) {
        _commandClean = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return _commandClean;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *views = self.subviews;
    for (id object in views) {
        if ([object isKindOfClass:[UITextField class]]) {
            [object resignFirstResponder];
        }
    }
}


@end
