//
//  HGBaseMainController.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGBaseMainController : UIViewController

@property(nonatomic,copy) NSString *TestStr;

@property(nonatomic,strong) HGNetworkUtils *Connection;

@property(nonatomic,strong) HGHUD *HUD;


@end

NS_ASSUME_NONNULL_END
