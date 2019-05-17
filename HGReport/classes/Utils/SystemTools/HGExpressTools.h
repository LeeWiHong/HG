//
//  HGExpressTools.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/15.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGExpressTools : NSObject

+ (BOOL)isValidPhone:(NSString *)phone;

+ (BOOL)checkPassword:(NSString *) password;

@end

NS_ASSUME_NONNULL_END
