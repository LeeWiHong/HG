//
//  HGRegSetMainController.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGBaseMainController.h"

@class HGUserInfoModel;
typedef void(^RegSetReturnBlock)(HGUserInfoModel *UserInfoModel);

NS_ASSUME_NONNULL_BEGIN

@interface HGRegSetMainController : HGBaseMainController

@property(nonatomic,copy) NSString *PublickKey;

@property(nonatomic,copy) NSString *telephone;

@property(nonatomic,copy) RegSetReturnBlock RegSetReturn;


@end

NS_ASSUME_NONNULL_END
