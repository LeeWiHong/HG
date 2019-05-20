//
//  HGPersonalTabView.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/11.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PersonalSelectBlock)(NSInteger row);

NS_ASSUME_NONNULL_BEGIN

@interface HGPersonalTabView : UITableView

@property(nonatomic,strong) NSMutableArray *SettingArray;

@property(nonatomic,copy) PersonalSelectBlock PersonalSelectBlock;

@end

NS_ASSUME_NONNULL_END
