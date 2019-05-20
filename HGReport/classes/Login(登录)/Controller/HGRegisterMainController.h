//
//  HGRegisterMainController.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/13.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGBaseMainController.h"
@class HGUserInfoModel;
typedef void(^RegisterReturnBlock)(HGUserInfoModel *UserInfoModel);

NS_ASSUME_NONNULL_BEGIN

@interface HGRegisterMainController : HGBaseMainController

@property(nonatomic,copy) RegisterReturnBlock RegisterReturn;

@end

NS_ASSUME_NONNULL_END
