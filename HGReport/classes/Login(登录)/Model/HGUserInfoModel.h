//
//  HGUserInfoModel.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/17.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGUserInfoModel : NSObject

@property(nonatomic,copy) NSString *headImage;

@property(nonatomic,assign) NSInteger *userId;

@property(nonatomic,copy) NSString *userName;

@property(nonatomic,copy) NSString *userTelephone;

@property(nonatomic,copy) NSString *userToken;

@end

NS_ASSUME_NONNULL_END
