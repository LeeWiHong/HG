//
//  HGAdviceFeedView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/20.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGAdviceFeedView.h"

@interface HGAdviceFeedView()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation HGAdviceFeedView

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpAdviceFeedView];
    }
    return self;
}

#pragma mark - 初始化意见反馈视图

- (void) setUpAdviceFeedView
{
//    对于scrollview来讲因为他的大小是contentsize来决定的,所以需要一个自视图将他撑开
    UIScrollView *AdviceScrollView = [[UIScrollView alloc] init];
    AdviceScrollView.contentSize = CGSizeMake(HGWidth, HGHeight + 100 * HGAutoHeight);
    AdviceScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:AdviceScrollView];
    
    [AdviceScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.bottom.equalTo(self.bottom).offset(-80 * HGAutoHeight);
        make.right.equalTo(self.right).offset(0);
    }];
    
    UIView *PlaceView = [[UIView alloc] init];
    [AdviceScrollView addSubview:PlaceView];
    
    [PlaceView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(AdviceScrollView.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(HGHeight + HGAutoHeight);
    }];
    
    UILabel *TitleLabel = [UILabel LabelWithFone:16 Color:HGBlack];
    TitleLabel.text = @"反馈标题:";
    [PlaceView addSubview:TitleLabel];

    [TitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(PlaceView.top).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(30 * HGAutoWidth);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];

    UITextField *TitleField = [[UITextField alloc] init];
    TitleField.placeholder = @"标题内容";
    TitleField.borderStyle = UITextBorderStyleRoundedRect;
    TitleField.textAlignment = NSTextAlignmentLeft;
    TitleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    TitleField.keyboardType = UIKeyboardTypeDefault;
    self.TitleField = TitleField;
    [PlaceView addSubview:TitleField];

    [TitleField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TitleLabel.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(30 * HGAutoWidth);
        make.right.equalTo(PlaceView.right).offset(-30 * HGAutoWidth);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];

    UIView *TopSepLine = [[UIView alloc] init];
    TopSepLine.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [PlaceView addSubview:TopSepLine];

    [TopSepLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TitleField.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(0);
        make.right.equalTo(PlaceView.right).offset(0);
        make.height.mas_equalTo(1);
    }];

    UITextView *ContentView = [[UITextView alloc] init];
    ContentView.text = @"请简要描述您的问题,不少于10个字符，如有问题需要咨询的可以联系我的微信";
    ContentView.textAlignment = NSTextAlignmentLeft;
    ContentView.keyboardType = UIKeyboardTypeDefault;
    ContentView.delegate = self;
    self.ContentView = ContentView;
    [PlaceView addSubview:ContentView];

    [ContentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TopSepLine.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(30 * HGAutoWidth);
        make.right.equalTo(PlaceView.right).offset(-30 * HGAutoWidth);
        make.height.mas_equalTo(360 * HGAutoHeight);
    }];

    UIView *BottomSepLine = [[UIView alloc] init];
    BottomSepLine.backgroundColor = [UIColor colorWithHexString:HGWhiteGray];
    [PlaceView addSubview:BottomSepLine];

    [BottomSepLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ContentView.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(0);
        make.right.equalTo(PlaceView.right).offset(0);
        make.height.mas_equalTo(1);
    }];

    UILabel *TelephoneLabel = [UILabel LabelWithFone:14 Color:HGBlack];
    TelephoneLabel.text = @"电话:";
    [PlaceView addSubview:TelephoneLabel];

    [TelephoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BottomSepLine.bottom).offset(20 * HGAutoHeight);
        make.left.equalTo(PlaceView.left).offset(30 * HGAutoWidth);
        make.height.mas_equalTo(80 * HGAutoHeight);
        make.width.mas_equalTo(80 * HGAutoWidth);
    }];

    UITextField *TelePhoneField = [[UITextField alloc] init];
    TelePhoneField.borderStyle = UITextBorderStyleRoundedRect;
    TelePhoneField.textAlignment = NSTextAlignmentLeft;
    TelePhoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    TelePhoneField.keyboardType = UIKeyboardTypeNumberPad;
    TelePhoneField.placeholder = @"手机号码";
    TelePhoneField.delegate = self;
    self.TelePhoneField = TelePhoneField;
    [PlaceView addSubview:TelePhoneField];

    [TelePhoneField makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(TelephoneLabel.centerY).offset(0);
        make.left.equalTo(TelephoneLabel.right).offset(20 * HGAutoWidth);
        make.right.equalTo(PlaceView.right).offset(-20 * HGAutoWidth);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
    
    UIButton *SubmitBtn = [UIButton BtnWithImage:nil NormalTitle:@"提  交" NormalTitleColor:HGWhite TitleFont:24 BoolTitleFont:NO];
    SubmitBtn.backgroundColor = [UIColor colorWithHexString:HGRED];
    self.SubmitBtn = SubmitBtn;
    [self addSubview:SubmitBtn];
    
    [SubmitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.centerX).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
        make.right.equalTo(self.right).offset(0);
        make.height.mas_equalTo(80 * HGAutoHeight);
    }];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"请简要描述您的问题,不少于10个字符，如有问题需要咨询的可以联系我的微信"]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"请简要描述您的问题,不少于10个字符，如有问题需要咨询的可以联系我的微信";
    }
}

@end
