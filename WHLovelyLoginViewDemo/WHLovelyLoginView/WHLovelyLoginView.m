//
//  WHLovelyLoginView.m
//  WHLovelyLoginViewDemo
//
//  Created by deyi on 15/8/26.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "WHLovelyLoginView.h"

#define screenSize    [UIScreen mainScreen].bounds.size

@interface WHLovelyLoginView () <UITextFieldDelegate>
{
    WHLoginViewType showType;
}

@property (nonatomic, strong) UIImageView *bodyImage;
@property (nonatomic, strong) UIImageView *leftArmImage;
@property (nonatomic, strong) UIImageView *rightArmImage;

@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passwordField;

@property (nonatomic, strong) UIImageView *leftHandImage;
@property (nonatomic, strong) UIImageView *rightHandImage;

@property (nonatomic, strong) UIImageView *accountBg;
@property (nonatomic, strong) UIImageView *pwdBg;

@property (nonatomic, strong) UIView *bgView;



@end

@implementation WHLovelyLoginView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        //默认frame
        self.frame = CGRectMake(30, 80, 320, 320);
        [self initAllViews];
        [self setRect];
    }
    return self;
}

- (void)initAllViews
{
    self.bodyImage.image = [UIImage imageNamed:@"owl-login"];
    [self addSubview:self.bodyImage];

    self.leftArmImage.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [self addSubview:self.leftArmImage];

    self.rightArmImage.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [self addSubview:self.rightArmImage];

    self.bgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bgView.layer.borderWidth = 1.0;
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];

    self.leftHandImage.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:self.leftHandImage];

    self.rightHandImage.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:self.rightHandImage];

    self.accountBg.image = [UIImage imageNamed:@"iconfont-user"];
    [self.accountField.leftView addSubview:self.accountBg];

    self.pwdBg.image = [UIImage imageNamed:@"iconfont-password"];
    [self.passwordField.leftView addSubview:self.pwdBg];

    self.accountField.delegate = self;
    [self.bgView addSubview:self.accountField];

    self.passwordField.delegate = self;
    self.passwordField.secureTextEntry = YES;
    [self.bgView addSubview:self.passwordField];
}

- (void)setRect
{
    CGFloat bgViewH = 180;
    CGFloat bgViewW = 300;
    CGFloat bgViewX = self.frame.size.width / 2 - 300 / 2;
    CGFloat bgViewY = 100;
    self.bgView.frame = CGRectMake(bgViewX, bgViewY, bgViewW, bgViewH);

    CGFloat bodyImageH = 109;
    CGFloat bodyImageW = 211;
    CGFloat bodyImageX = self.frame.size.width / 2 - 211 / 2;
    CGFloat bodyImageY = 0;
    self.bodyImage.frame = CGRectMake(bodyImageX, bodyImageY, bodyImageW, bodyImageH);

    CGFloat leftArmImageH = 65;
    CGFloat leftArmImageW = 40;
    CGFloat leftArmImageX = 115;
    CGFloat leftArmImageY = 60 + 100;
    self.leftArmImage.frame = CGRectMake(leftArmImageX, leftArmImageY, leftArmImageW, leftArmImageH);

    CGFloat rightArmImageH = 65;
    CGFloat rightArmImageW = 40;
    CGFloat rightArmImageX = self.frame.size.width - 150;
    CGFloat rightArmImageY = 60 + 100;
    self.rightArmImage.frame = CGRectMake(rightArmImageX, rightArmImageY, rightArmImageW, rightArmImageH);

    CGFloat accountFieldH = 44;
    CGFloat accountFieldW = self.bgView.frame.size.width - 60;
    CGFloat accountFieldX = 30;
    CGFloat accountFieldY = 30;
    self.accountField.frame = CGRectMake(accountFieldX, accountFieldY, accountFieldW, accountFieldH);
    self.accountField.layer.cornerRadius = 10;
    self.accountField.layer.borderWidth = 0.5;
    self.accountField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.accountField.leftView.frame = CGRectMake(0, 0, 44, 44);
    self.accountField.leftViewMode = UITextFieldViewModeAlways;
    self.accountBg.frame = CGRectMake(11, 11, 22, 22);

    CGFloat passwordFieldH = 44;
    CGFloat passwordFieldW = self.bgView.frame.size.width - 60;
    CGFloat passwordFieldX = 30;
    CGFloat passwordFieldY = accountFieldY + accountFieldH + 30;
    self.passwordField.frame = CGRectMake(passwordFieldX, passwordFieldY, passwordFieldW, passwordFieldH);
    self.passwordField.layer.cornerRadius = 10;
    self.passwordField.layer.borderWidth = 0.5;
    self.passwordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.passwordField.leftView.frame = CGRectMake(0, 0, 44, 44);
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    self.pwdBg.frame = CGRectMake(11, 11, 22, 22);

    CGFloat leftHandImageH = 40;
    CGFloat leftHandImageW = 40;
    CGFloat leftHandImageX = leftArmImageX - 60;
    CGFloat leftHandImageY = bgViewY - 20;
    self.leftHandImage.frame = CGRectMake(leftHandImageX, leftHandImageY, leftHandImageW, leftHandImageH);

    CGFloat rightHandImageH = 40;
    CGFloat rightHandImageW = 40;
    CGFloat rightHandImageX = rightArmImageX + 60;
    CGFloat rightHandImageY = bgViewY - 20;
    self.rightHandImage.frame = CGRectMake(rightHandImageX, rightHandImageY, rightHandImageW, rightHandImageH);
}

/*
- (void)setConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bgView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0]];
}
*/
#pragma mark - UITextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{

    if ([textField isEqual:self.passwordField]) {
        if (showType == WHLoginViewType_PASS)
        {
            showType = WHLoginViewType_PASS;
            return;
        }
        showType = WHLoginViewType_PASS;
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat leftArmImageX = 115;
            CGFloat leftArmImageY = 60;
            self.leftArmImage.frame = CGRectMake(leftArmImageX, leftArmImageY, self.leftArmImage.frame.size.width, self.leftArmImage.frame.size.height);

            CGFloat rightArmImageX = self.frame.size.width - 150;
            CGFloat rightArmImageY = 60;
            self.rightArmImage.frame = CGRectMake(rightArmImageX, rightArmImageY, self.rightArmImage.frame.size.width, self.rightArmImage.frame.size.height);

            self.leftHandImage.frame = CGRectMake(self.leftHandImage.frame.origin.x + 70, self.leftHandImage.frame.origin.y + 20, 0, 0);

            self.rightHandImage.frame = CGRectMake(self.rightHandImage.frame.origin.x - 30, self.rightHandImage.frame.origin.y + 20, 0, 0);
        }];
    }
    else if ([textField isEqual:self.accountField]){
        if (showType != WHLoginViewType_PASS)
        {
            showType = WHLoginViewType_USER;
            return;
        }
        showType = WHLoginViewType_USER;
        [UIView animateWithDuration:0.5 animations:^{
            self.leftArmImage.frame = CGRectMake(self.leftArmImage.frame.origin.x - 30, self.leftArmImage.frame.origin.y + 50, self.leftArmImage.frame.size.width, self.leftArmImage.frame.size.height);

            self.rightArmImage.frame = CGRectMake(self.rightArmImage.frame.origin.x + 48, self.rightArmImage.frame.origin.y + 50, self.rightArmImage.frame.size.width, self.rightArmImage.frame.size.height);

            CGFloat leftHandImageW = 40;
            CGFloat leftHandImageH = 40;
            self.leftHandImage.frame = CGRectMake(self.leftHandImage.frame.origin.x - 70, self.leftHandImage.frame.origin.y - 20, leftHandImageW, leftHandImageH);

            CGFloat rightHandImageH = 40;
            CGFloat rightHandImageW = 40;
            self.rightHandImage.frame = CGRectMake(self.rightHandImage.frame.origin.x + 30, self.rightHandImage.frame.origin.y - 20, rightHandImageW, rightHandImageH);

        }];
    }
}
#pragma mark - lazy load

- (UIImageView *)bodyImage
{
    if (_bodyImage == nil) {
        _bodyImage = [[UIImageView alloc] init];
    }
    return _bodyImage;
}

- (UIImageView *)leftArmImage
{
    if (_leftArmImage == nil) {
        _leftArmImage = [[UIImageView alloc] init];
    }
    return _leftArmImage;
}

- (UIImageView *)rightArmImage
{
    if (_rightArmImage == nil) {
        _rightArmImage = [[UIImageView alloc] init];
    }
    return _rightArmImage;
}

- (UITextField *)accountField
{
    if (_accountField == nil) {
        _accountField = [[UITextField alloc] init];
        _accountField.leftView = [[UIView alloc] init];
    }
    return _accountField;
}

- (UITextField *)passwordField
{
    if (_passwordField == nil) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.leftView = [[UIView alloc] init];
    }
    return _passwordField;
}

- (UIImageView *)rightHandImage
{
    if (_rightHandImage == nil) {
        _rightHandImage = [[UIImageView alloc] init];
    }
    return _rightHandImage;
}

- (UIImageView *)leftHandImage
{
    if (_leftHandImage == nil) {
        _leftHandImage = [[UIImageView alloc] init];
    }
    return _leftHandImage;
}

- (UIImageView *)accountBg
{
    if (_accountBg == nil) {
        _accountBg = [[UIImageView alloc] init];
    }
    return _accountBg;
}

- (UIImageView *)pwdBg
{
    if (_pwdBg == nil) {
        _pwdBg = [[UIImageView alloc] init];
    }
    return _pwdBg;
}

- (UIView *)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
    }
    return _bgView;
}

@end
