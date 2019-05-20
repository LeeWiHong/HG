//
//  HGAdviceFeedView.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/20.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGAdviceFeedView : UIView

@property(nonatomic,weak) UITextView *ContentView;

@property(nonatomic,weak) UITextField *TitleField;

@property(nonatomic,weak) UITextField *TelePhoneField;

@property(nonatomic,weak) UIButton *SubmitBtn;
@end

NS_ASSUME_NONNULL_END
