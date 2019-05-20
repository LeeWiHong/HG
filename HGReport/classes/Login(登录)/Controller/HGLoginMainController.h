//
//  HGLoginMainController.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/12.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import "HGBaseMainController.h"
@class HGUserInfoModel;

typedef void(^LoginReturnBlock)(HGUserInfoModel *UserInfoModel);

NS_ASSUME_NONNULL_BEGIN

@interface HGLoginMainController : HGBaseMainController

@property(nonatomic,copy) LoginReturnBlock LoginReturn;

@end

NS_ASSUME_NONNULL_END
