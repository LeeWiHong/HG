//
//  HGPersonalMainController.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGPersonalMainController.h"
#import "HGPersonalTabView.h"
#import "HGPersonalHeaderView.h"
#import "HGLoginMainController.h"
#import "HGUserInfoModel.h"

@interface HGPersonalMainController ()

@property(nonatomic,weak) HGPersonalHeaderView *PersonalHeadView;
@end

@implementation HGPersonalMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    NSMutableArray *SettingArray = [NSMutableArray arrayWithArray:@[@"我的收藏",@"意见反馈",@"设置"]];
    HGPersonalTabView *PersonalView = [[HGPersonalTabView alloc] initWithFrame:HGFrame style:UITableViewStylePlain];
    PersonalView.yz_headerScaleImage = [UIImage imageNamed:@"111"];
    PersonalView.yz_headerScaleImageHeight = 90;
    PersonalView.showsVerticalScrollIndicator = NO;
    HGPersonalHeaderView *PersonalHeadView = [[HGPersonalHeaderView alloc] initWithFrame:CGRectMake(0, 0, HGWidth, 90)];
    PersonalView.SettingArray = SettingArray;
    PersonalView.tableHeaderView = PersonalHeadView;
    
    [PersonalHeadView.PersonalButton addTarget:self action:@selector(Jump2LoginView) forControlEvents:UIControlEventTouchUpInside];
    self.PersonalHeadView = PersonalHeadView;
    [self.view addSubview:PersonalView];
    
    [PersonalView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.right.equalTo(self.view.right).offset(0);
    }];
    
}

#pragma mark - 跳转到登录界面

- (void) Jump2LoginView
{
    HGLoginMainController *LoginVC = [[HGLoginMainController alloc] init];
    LoginVC.navigationItem.title = @"登录";
    LoginVC.hidesBottomBarWhenPushed = YES;
    LoginVC.LoginReturn = ^(HGUserInfoModel *UserInfoModel) {
        self.PersonalHeadView.PersonalButton.titleLabel.text = UserInfoModel.userName;
        [self.PersonalHeadView.PersonalHeadView sd_setImageWithURL:[NSURL URLWithString:[WEBURL stringByAppendingString:UserInfoModel.headImage]] placeholderImage:[UIImage imageNamed:@"defaulthead"]];
    };
    [self.navigationController pushViewController:LoginVC animated:YES];
}



@end
