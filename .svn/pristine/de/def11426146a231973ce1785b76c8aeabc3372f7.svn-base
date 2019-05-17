//
//  HGPersonalTabView.m
//  HGReport
//
//  Created by LeeWiHong on 2019/5/11.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGPersonalTabView.h"
#import "HGPersonalTabCell.h"


@interface HGPersonalTabView ()<UITableViewDelegate,UITableViewDataSource>

@end

NSString *PersonalCell = @"HGPersonalTabCell";

@implementation HGPersonalTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registerClass:[HGPersonalTabCell class] forCellReuseIdentifier:PersonalCell];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.SettingArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HGPersonalTabCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonalCell];
    if (cell == NULL) {
        cell = [[HGPersonalTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PersonalCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *Title = self.SettingArray[indexPath.row];
    cell.Title = Title;
    return cell;
    
}







@end
